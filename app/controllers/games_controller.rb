class GamesController < ApplicationController
  def new
    @player_game = PlayerGame.new
  end

  def create
    Game.new(movie: Movie.all.sample)
  end

  def show
  end

  # TIMER GAME
  #Method to reveal a random word



end
