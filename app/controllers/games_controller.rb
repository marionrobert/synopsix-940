class GamesController < ApplicationController
  def new
    @player_game = PlayerGame.new
    @game_type = params[:game_type]
  end

  def create
    Game.new(movie: Movie.all.sample)
  end

  def show
  end

  # TIMER GAME
  #Method to reveal a random word



end
