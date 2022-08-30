class InputsController < ApplicationController
  def create
    @player_game = PlayerGame.find(params[:player_game_id])
    @input = Input.new(input_params)
    @input.player_game = @player_game
    checkinput
    checktitle

    if @input.save
      redirect_to player_game_path(PlayerGame.find(params[:player_game_id]))
    else
      redirect_to player_game_path(PlayerGame.find(params[:player_game_id]))
    end
  end

  def checkinput
    #si le dernier input est compris dans player_game.words
    #alors je change le statut de word : found = true
    if @player_game.words.key?(@input.content.downcase)
      @player_game.words[@input.content.downcase]["found"] = true
      @player_game.save
    end
  end

  def checktitle
    # si l'input == title --> player_game.title_found = true
    if @input.content.downcase == @player_game.game.movie.title.downcase
      @player_game.title_found = true
      @player_game.save
    end
  end

  private

  def input_params
    params.require(:input).permit(:content)
  end
end
