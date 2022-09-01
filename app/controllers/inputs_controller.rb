class InputsController < ApplicationController
  def create
    @player_game = PlayerGame.find(params[:player_game_id])
    @input = Input.new(input_params)
    @input.player_game = @player_game

    #Timer Game -------------
      #check if title dowcase == input downcase

    # Word input game -------------
    respond_to do |format|
      if @input.save
        checkinput
        checkwin?
        format.html {redirect_to player_game_path(@player_game)}
        #if json input (game_input_controller.js)
        format.json do
          render json: {
            game_content: render_to_string(partial: "player_games/game_content", locals: { player_game: @player_game }, formats: [:html]),
            form_input: render_to_string(partial: "player_games/form_input", locals: { player_game: @player_game, input: Input.new}, formats: [:html])
          }
        end

      else
        format.html {redirect_to player_game_path(@player_game)}
        # if json input (game_input_controller.js)
        format.json do
          render json: {
            game_content: render_to_string(partial: "player_games/game_content", locals: { player_game: @player_game }, formats: [:html]),
            form_input: render_to_string(partial: "player_games/form_input", locals: { player_game: @player_game, input: @input}, formats: [:html])
          }
        end
      end
    end
  end

  def checkinput
    # si l'input est compris dans words ou dans words_title
    # alors je change le statut de word : found = true
    update_score_proximity
    if @player_game.words.key?(@input.content)
      @player_game.words[@input.content]["found"] = true
      @player_game.save
    end
    if @player_game.words_title.key?(@input.content)
      @player_game.words_title[@input.content]["found"] = true
      @player_game.save
    end
  end

  def checkwin?
    if @input.content == @player_game.game.movie.title.downcase || @player_game.words_title.all? { |key, value| value["found"] == true }
      @player_game.title_found = true
      @player_game.save
    end
  end

  def update_score_proximity
    @player_game.words.each_key do |word|

      new_score = JaroWinkler.distance(word, @input.content)
      if new_score > @player_game.words[word]["score_proximity"] #current_score
        if new_score >= 0.95
          @player_game.words[word]["found"] = true
        else
          @player_game.words[word]["score_proximity"] = new_score
          @player_game.words[word]["input_to_display"] = @input.content
        end
      end

    end
    @player_game.words_title.each_key do |word|
      new_score = JaroWinkler.distance(word, @input.content)

      if new_score > @player_game.words_title[word]["score_proximity"] #current_score
        if new_score >= 0.95
          @player_game.words[word]["found"] = true
        else
          @player_game.words_title[word]["score_proximity"] = new_score
          @player_game.words_title[word]["input_to_display"] = @input.content

        end
      end
    end
    @player_game.save
  end

  private

  def input_params
    params.require(:input).permit(:content)
  end
end
