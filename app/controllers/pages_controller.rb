class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @player_game = PlayerGame.new
  end

  def dashboard
    @input_games = current_user.games.input
    @timer_games = current_user.games.timer
    @players_inputgame = User.all.drop(1).sort_by { |user| -user.inputgame_score }
    @players_timergame = User.all.drop(1).sort_by { |user| -user.timergame_score }
    # récupérer tous les player_games où l'utilisateur a trouvé le film
    @wins = current_user.player_games.where(title_found: true)
    # récupérer tous les player_games où le title était found et le game était en mode input
    @wins_inputgame = []
    @wins.each { |win| @wins_inputgame << win if win.game.input? }
    # récupérer tous les player_games où le title était found et le game était en mode timer
    @wins_timergame = []
    @wins.each { |win| @wins_timergame << win if win.game.timer? }
  end

end
