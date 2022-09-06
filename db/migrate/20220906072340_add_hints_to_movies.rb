class AddHintsToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :hints, :string, array: true, default: []
  end
end
