class CreateInputs < ActiveRecord::Migration[7.0]
  def change
    create_table :inputs do |t|
      t.references :player_game, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
