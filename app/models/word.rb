class Word < ApplicationRecord
  belongs_to :player_game
  belongs_to :game
end
