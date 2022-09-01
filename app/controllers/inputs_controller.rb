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
    # si l'input string est strictement égal au title OU si tous les words du
    # title ont un statut found true, alors le titre est découvert jeu est gagné
    if @input.content == @player_game.game.movie.title.downcase || @player_game.words_title.all? { |key, value| value["found"] == true }
      @player_game.title_found = true
      @player_game.save
    end
  end

  private

  def input_params
    params.require(:input).permit(:content)
  end
end
