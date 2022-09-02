class TimersController < ApplicationController

  def create
    @player_game = PlayerGame.find(params[:player_game_id])
    #TODO replace to by random word not already revealed
    @word = find_word
    @input = Input.new(content: @word, source: :timer)
    @input.player_game = @player_game

    @input.save



    checkinput



    render json: {game_content: render_to_string(partial: "player_games/game_content", locals: { player_game: @player_game }, formats: [:html])}

  end


  def checkinput
    #si l'input est compris dans words ou dans words_title
    #alors je change le statut de word : found = true
    if @player_game.words.key?(@input.content)
      @player_game.words[@input.content]["found"] = true
      @player_game.save
    end
    if @player_game.words_title.key?(@input.content)
      @player_game.words_title[@input.content]["found"] = true
      @player_game.save
    end
  end


  def find_word
    not_found_words = @player_game.words.keys.reject do |w|
      @player_game.words[w]["found"]
    end
    not_found_words.sample
  end
end
