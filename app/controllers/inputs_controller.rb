class InputsController < ApplicationController
  def create
    @player_game = PlayerGame.find(params[:player_game_id])
    @input = Input.new(input_params)
    @input.player_game = @player_game

    @input.save



    #Timer Game -------------

      #check if title dowcase == input downcase


    # Word input game -------------
    checkinput
    checkwin?

    #managing ajax rendering on the page
    respond_to do |format|
      # if no input in form
      format.html do
        redirect_to player_game_path(@player_game)
      end
      #if json input (game_input_controller.js)
      format.json do
        render json: {game_content: render_to_string(partial: "player_games/game_content", locals: { player_game: @player_game }, formats: [:html])}
      end
    end




    #TODO : Manage errors on input
    # if @input.save
    #   redirect_to player_game_path(PlayerGame.find(params[:player_game_id]))
    # else
    #   redirect_to player_game_path(PlayerGame.find(params[:player_game_id]))
    # end

  end

  def checkinput
    #si l'input est compris dans words ou dans words_title
    #alors je change le statut de word : found = true
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
    if @input.content == @player_game.game.movie.title.downcase || @player_game.words_title.all? { | key, value| value["found"] == true }
      @player_game.title_found = true
      @player_game.save
    end
  end



  private

  def input_params
    params.require(:input).permit(:content)
  end
end
