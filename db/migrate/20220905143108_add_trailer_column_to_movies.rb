class AddTrailerColumnToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :trailer, :text
  end
end
