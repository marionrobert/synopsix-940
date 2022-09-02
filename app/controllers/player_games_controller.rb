class PlayerGamesController < ApplicationController

  def create
    category_id = params[:player_game][:category]
    game = Game.create(movie: Movie.where(category_id: category_id).sample)
    player_game = PlayerGame.create(user: current_user, game: game, title_found: false)
    redirect_to player_game_path(player_game)
  end

  def show
    @player_game = PlayerGame.find(params[:id])
    @hidden_title = @player_game.hidden_title
    @hidden_synopsis = @player_game.hidden_synopsis
    @input = Input.new
    @title = @player_game.game.movie.title

    #managing source of inputs
    if @player_game.game.input?
      @inputs = @player_game.inputs
    else
      @inputs = @player_game.inputs.where(source: :input)
    end
  end



end
