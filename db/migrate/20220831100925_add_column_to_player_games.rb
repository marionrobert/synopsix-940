class AddColumnToPlayerGames < ActiveRecord::Migration[7.0]
  def change
    add_column :player_games, :words_title, :jsonb
  end
end
