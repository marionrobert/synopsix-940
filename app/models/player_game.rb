class PlayerGame < ApplicationRecord
    attr_accessor :category, :game_type
  has_many :inputs
  belongs_to :user
  belongs_to :game
  after_create :build_words, :build_words_title, :hidden_synopsis, :hidden_title


  delegate :movie, to: :game # == game.movie

  def last_five_inputs
    inputs.input.order(created_at: :desc).first(5)
  end

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
      words[w.downcase] = { found: false, score_proximity: 0.0, input_to_display: '&nbsp' }
    end

    # update instance of player game
    self.update(words: words)
  end

  # #>>>> Version 2 - traiter le titre comme un ensemble de mots
  def build_words_title
    words_title = {}
    title = self.game.movie.title
    title_array = title.split( /\b/ )
    only_words_title = title_array.reject { |w| w =~ /\W+/ }
    only_words_title.each do |w|
      words_title[w.downcase] = {found: false, score_proximity: 0.0, input_to_display: '&nbsp' }
    end
    self.update(words_title: words_title)
  end

  def hidden_synopsis
    #get the synopsis
    synopsis = self.game.movie.synopsis

    #split the synopsis with word borders
    displayed_synopsis = synopsis.split(/\b/)

    #   pour chaque mot du synopsis,
    displayed_synopsis.map! do |element|
      # on display l'élément sauf si l'élément commence par une lettre ou un chiffre
      next "<span>#{element}</span>" unless element.downcase.first =~ /([a-z]|\d)/

      if self.words[element.downcase]["found"]
        "<span class='wfound'>#{element}</span>".html_safe
      elsif self.words[element.downcase]["score_proximity"] >= 0.8
        "<span class='not_far_to_found'>&nbsp#{self.words[element.downcase]['input_to_display']}&nbsp</span>".html_safe
      elsif self.words[element.downcase]["score_proximity"] >= 0.7
        "<span class='far_to_found'>&nbsp#{self.words[element.downcase]['input_to_display']}&nbsp</span>".html_safe
      else
        "<span class='not_found'>&nbsp#{element.chars.map { '&nbsp' }.join}&nbsp</span>".html_safe
      end
    end
    #display_array to string + html.safe = à intepréter comme du html
    displayed_synopsis.join.html_safe
  end

  # >>>> Version 2 : traiter le titre comme un ensemble de mots
  def hidden_title
    hidden_title_input

  end

  def hidden_title_timer
    displayed_title = self.game.movie.title.split(/\b/)

    # display le film caché sauf si le title_found = true
    displayed_title.map! do |element|
      next "<span>#{element}</span>" unless element.downcase.first =~ /([a-z]|\d)/

      "<span style='background-color: black'>#{element.chars.map { '&nbsp' }.join}</span>".html_safe
    end
    displayed_title.join.html_safe
  end

  def hidden_title_input
    displayed_title = self.game.movie.title.split(/\b/)

    # display le film caché sauf si le title_found = true
    displayed_title.map! do |element|
      next "<span>#{element}</span>" unless element.downcase.first =~ /([a-z]|\d)/



      if self.words_title[element.downcase]["found"]
        "<span class='wfound'>#{element}</span>".html_safe
      elsif self.words_title[element.downcase]["score_proximity"] >= 0.8
        "<span class='not_far_to_found'>&nbsp#{self.words_title[element.downcase]['input_to_display']}&nbsp</span>".html_safe
      elsif self.words_title[element.downcase]["score_proximity"] >= 0.7
        "<span class='far_to_found'>&nbsp#{self.words_title[element.downcase]['input_to_display']}&nbsp</span>".html_safe
      else
        "<span class='not_found'>&nbsp#{element.chars.map { '&nbsp' }.join}&nbsp</span>".html_safe

      end
    end
    displayed_title.join.html_safe
  end

  def calculate_score
    score = 5000
    inputs = self.inputs
    inputs.each_with_index do |input, index|
      if index <= 9
        score -= 5
      elsif index > 9 && index <= 29
        score -= 10
      elsif index > 29 && index <= 59
        score -= 15
      elsif index > 59 && index <= 99
        score -= 20
      else
        score -= 25
      end
    end
    score = 0 if score.negative?
    self.final_score = score
  end
end
