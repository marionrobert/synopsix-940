class Input < ApplicationRecord
  belongs_to :player_game
  before_save :downcase_content
  validate :strip_content, :check_english_word
  enum source: {
    input: 0,
    timer: 1,
  }
  default_scope { order(created_at: :desc) }

  def downcase_content
    self.content = self.content.downcase
  end

  def strip_content
    self.content = self.content.strip
  end

  def check_english_word
    File.open(Rails.root.join("public/dictionnary/en.txt")) do |file|
      errors.add(:content, "must be an english word") unless file.read.include?(content.downcase) ||
                                                             player_game.words.key?(content.downcase) ||
                                                             player_game.words_title.key?(content.downcase) ||
                                                             content.downcase == player_game.game.movie.title.downcase ||
                                                             content.downcase.match?(/^\d+(rd|st|th|s|nd)?$/) ||
                                                             player_game.game.timer?
    end
  end
end
