class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.string :synopsis
      t.text :poster
      t.timestamps
    end
  end
end
