class AddHintsToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :hint_1, :string
    add_column :movies, :hint_2, :string
    add_column :movies, :hint_3, :string
  end
end
