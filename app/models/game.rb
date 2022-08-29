class Game < ApplicationRecord
  belongs_to :movie
  belongs_to :multiplayer_session
end
