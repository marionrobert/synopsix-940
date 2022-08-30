class PlayerGame < ApplicationRecord
  attr_accessor :category
  has_many :inputs
  belongs_to :user
  belongs_to :game
  after_create :build_words, :hidden_synopsis, :hidden_title

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

  def hidden_synopsis
    #get the synopsis
    synopsis = self.game.movie.synopsis

    #split the synopsis with word borders
    display_array = synopsis.split(/\b/)

    #   pour chaque mot du synopsis,
    display_array.map! do |element|
      # on display l'élément sauf si l'élément commence par une lettre ou un chiffre
      next "<span>#{element}</span>" unless element.downcase.first =~ /([a-z]|\d)/

      if self.words[element.downcase]["found"]
        "<span>#{element}</span>"
      else
        "<span style='background-color: black'>#{element.chars.map { '&nbsp' }.join}</span>"
      end

    end
    #display_array to string + html.safe = à intepréter comme du html
    display_array.join.html_safe
  end

  def hidden_title
    title = self.game.movie.title

    # display le film caché sauf si le title_found = true
    if self.title_found
      "<span>#{title}</span>".html_safe
    else
      "<span style='background-color: black'>#{title.chars.map { '&nbsp' }.join}</span>".html_safe
    end
  end

end
