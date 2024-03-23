class GamesController < ApplicationController
  def new
    @player_game = PlayerGame.new
    @game_type = params[:game_type]
  end

  def create
    Game.new(movie: Movie.all.sample)
  end
end
