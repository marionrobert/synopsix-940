class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @player_game = PlayerGame.new
  end

  def dashboard
    @input_games = current_user.games.input
    @timer_games = current_user.games.timer
  end
end
