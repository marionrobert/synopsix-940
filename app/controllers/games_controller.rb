class GamesController < ApplicationController
  def new
    @player_game = PlayerGame.new
  end

  def create
    Game.new(movie: Movie.all.sample)
  end

  def show
  end


end
