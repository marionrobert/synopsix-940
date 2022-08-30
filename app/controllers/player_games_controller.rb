class PlayerGamesController < ApplicationController


  def create

    game = Game.create(movie: Movie.where(category: params[:player_game][:category]).sample)

    player_game = PlayerGame.create(user: current_user, game: game, title_found: false)

    redirect_to player_game_path(player_game)

  end

  def show
    @title = PlayerGame.find(params[:id]).game.movie.title
    @synopsis = PlayerGame.find(params[:id]).game.movie.synopsis
    @player_game = PlayerGame.find(params[:id])
    @input = Input.new
    @inputs = @player_game.inputs


  end

  def checkwords
    
  end

end
