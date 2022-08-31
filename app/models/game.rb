class Game < ApplicationRecord
  belongs_to :movie
  has_many :player_games
  enum game_type: {
    input: 0,
    timer: 1,
  }
end
