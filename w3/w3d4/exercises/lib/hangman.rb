class Hangman
    attr_reader :guesser, :referee, :board
    MAX_GUESSES = 8

    def initialize(players)
      @guesser = players[:guesser]
      @referee = players[:referee]
      @num_remaining_guesses = MAX_GUESSES
    end

    def play
      setup
    end

    def setup
      secret_length = @referee.pick_secret_word
      @guesser.register_secret_length(secret_length)
      @board = ["_"] * secret_length
    end

    def take_turn
      guess = @guesser.guess(@board)
      index_array = @referee.check_guess(guess)
      update_board(guess, index_array)

      @num_remaining_guesses -= 1 if index_array.empty?

      @guesser.handle_response(guess, index_array)
    end

    def update_board(guess, index_array)
      index_array.each do |i|
        @board[i] = guess
      end
    end

    def won?

    end
end

class HumanPlayer
  def register_secret_length(length)
    puts "Secret is #{length} letters long"
  end

  def guess(board)
    p board
    puts "Enter a guess"
    gets(1).chomp
  end
end

class ComputerPlayer

  def initialize (dictionary)
    @dictionary = dictionary
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word.length
  end

  def check_guess(letter)
    #accepts a letter
    index_array = []
    @secret_word.each_char.with_index do |char,i|
      index_array << i if letter == char
    end
    index_array
  end

  def register_secret_length(length)
    @available_words = @dictionary.select do |word|
      word if word.length == length
    end
  end

  def handle_response(guess, index_array)
    p 'handle'
  end

  def guess(board)

  end
end

# @comp = ComputerPlayer.new(["foobar"])
# @comp.pick_a_secret_word
# p @comp.check_guess("z")