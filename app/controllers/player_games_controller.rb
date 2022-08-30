class PlayerGamesController < ApplicationController


  def create

    game = Game.create(movie: Movie.where(category: params[:player_game][:category]).sample)

    player_game = PlayerGame.create(user: current_user, game: game, title_found: false)

    redirect_to player_game_path(player_game)

  end

  def show
  end
end
