class AddTimergameScoreToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :timergame_score, :integer, default: 0
  end
end
