class Input < ApplicationRecord
  belongs_to :player_game

  before_save :downcase_content

  validate :check_english_word

  def downcase_content
    self.content = self.content.downcase
  end

  def check_english_word
    File.open(Rails.root.join("public/dictionnary/en.txt")) do |file|
      errors.add(:content, "must be an english word") unless file.read.include?(content.downcase) ||
                                                            player_game.words.key?(content.downcase) ||
                                                            player_game.words_title.key?(content.downcase) ||
                                                            (content.downcase == player_game.game.movie.title.downcase)
    end
  end
end
