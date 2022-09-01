class RemovePhotoFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :photo, :text
  end
end
