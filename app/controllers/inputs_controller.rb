class InputsController < ApplicationController
  def create
    Input.create(content: params[:input][:content], player_game_id: params[:player_game_id] )
    redirect_to player_game_path(PlayerGame.find(params[:player_game_id]))
  end
end
