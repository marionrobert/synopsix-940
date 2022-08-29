class CreateMultiplayerSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :multiplayer_sessions do |t|

      t.timestamps
    end
  end
end
