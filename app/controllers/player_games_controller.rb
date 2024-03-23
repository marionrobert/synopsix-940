class PlayerGamesController < ApplicationController
  def create
    if @category = Category.find(params[:player_game][:category]) rescue false
      if @category.name == "All"
        @movie = Movie.all.sample
      else
        @movie = Movie.where(category: @category).sample
      end
      if (@game = Game.create(movie: @movie, game_type: params[:player_game][:game_type].to_i)) && (@player_game = PlayerGame.create(user: current_user, game: @game, title_found: false, final_score: 0))
        redirect_to player_game_path(@player_game)
      else
        flash.now[:alert] = "Please select a category"
        render 'games/new', status: :unprocessable_entity
      end
    else
      @player_game = PlayerGame.new
      @player_game.errors.add(:game, 'should belong to a category')
      flash.now[:alert] = "Please select a category"
      render 'games/new', status: :unprocessable_entity
    end
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
