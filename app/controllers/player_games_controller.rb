class PlayerGamesController < ApplicationController
  def create
    if @category = Category.find(params[:player_game][:category]) rescue false
      if (@game = Game.create(movie: Movie.where(category: @category).sample)) && (@player_game = PlayerGame.create(user: current_user, game: @game, title_found: false))
        redirect_to player_game_path(@player_game)
      else
        render 'games/new', status: :unprocessable_entity, alert: 'You have to select a category'
      end
    else
      @player_game = PlayerGame.new
      @player_game.errors.add(:game, 'should belong to a category')
      render 'games/new', status: :unprocessable_entity
    end
  end

  def show
    @player_game = PlayerGame.find(params[:id])
    @hidden_title = @player_game.hidden_title
    @hidden_synopsis = @player_game.hidden_synopsis
    @input = Input.new
    @inputs = @player_game.inputs
    @title = @player_game.game.movie.title
  end
end
