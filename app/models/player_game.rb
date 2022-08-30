class PlayerGame < ApplicationRecord
  attr_accessor :category
  has_many :inputs
  belongs_to :user
  belongs_to :game
  after_create :build_words

  delegate :movie, to: :game # == game.movie



  def build_words
    # create empty hash
    words = {}

    # get synospsis string
    synopsis = self.game.movie.synopsis

    # split all words and caracters
    display_array = synopsis.split( /\b/ )

    # Get only words
    only_words_array = display_array.reject { |w| w =~ /\W+/ }

    # pour chaque mot ajouter au hash avec le mot en clé et un hash (found: false)
    only_words_array.each do |w|
      words[w.downcase] = {found: false}
    end

    # update instance of player game
    self.update(words: words)
  end


end
