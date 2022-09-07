class AddColumnLoseToPlayerGames < ActiveRecord::Migration[7.0]
  def change
    add_column :player_games, :lose, :boolean, default: false, null: false
  end
end
