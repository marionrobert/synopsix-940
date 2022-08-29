class CreatePlayerGames < ActiveRecord::Migration[7.0]
  def change
    create_table :player_games do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.integer :final_score
      t.boolean :title_found
      t.jsonb :words
      t.timestamps
    end
  end
end
