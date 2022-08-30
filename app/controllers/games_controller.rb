class GamesController < ApplicationController
  def new

  end

  def create
    Game.new(movie: Movie.all.sample)
  end

  def show
  end


end
