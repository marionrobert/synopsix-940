class PlayerGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  after_create :build_words

  delegate :movie, to: :game # == game.movie

  def build_words
        # créer un hash words vide
        words = {}
        # récupérer synopsis en string
        # transformer la string en array de mots (+downcase)
        # itérer sur l'array
        # pour chaque mot ajouter au hash avec le mot en clé et un hash (found: false)
        # self.update(words: words)


        #créer @title = movie title
  end


end
