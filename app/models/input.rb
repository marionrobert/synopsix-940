class Input < ApplicationRecord
  belongs_to :player_game

  before_save :downcase_content

  def downcase_content
    self.content = self.content.downcase
  end

end
