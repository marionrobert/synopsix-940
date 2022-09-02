class AddSourceToInput < ActiveRecord::Migration[7.0]
  def change
    add_column :inputs, :source, :integer, default: 0
  end
end
