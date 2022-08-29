class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :multiplayer_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
