class Game < ApplicationRecord
  belongs_to :movie
  has_many :player_games
end
