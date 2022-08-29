class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.references :player_game, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.string :content
      t.float :OPT_score_proximity
      t.float :OPT_close_word
      t.boolean :found

      t.timestamps
    end
  end
end
