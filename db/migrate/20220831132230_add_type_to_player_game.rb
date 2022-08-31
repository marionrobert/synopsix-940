class AddTypeToPlayerGame < ActiveRecord::Migration[7.0]
  def change
    add_column :player_games, :type, :integer
  end
end
