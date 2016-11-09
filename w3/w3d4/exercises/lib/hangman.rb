class Hangman
    attr_reader :guesser, :referee, :board

    def initialize(players)
      @guesser = players[:guesser]
      @referee = players[:referee]
      @num_remaining_guesses = 8
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
      @board.all?
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

  def pick_secret_word
    p "enter length of secret word"

    begin
      Integer(gets(1).chomp)
    rescue ArgumentError
      p "error entering length"
      retry
    end
  end

  def check_guess(guess)
    #test
    p guess
    gets.chomp.split(",").map do |i_str|

      raise "error: input" unless Integer(i_str)
    end

  end

  def handle_response(guess, response)
    puts "Found #{guess} at positions #{response}"
  end
end

class ComputerPlayer

  attr_reader :candidate_words

  def self.player_with_dict_file(dict_file_name)
    ComputerPlayer.new(File.readlines(dict_file_name).map(&:chomp))
  end

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
    @candidate_words = @dictionary.select do |word|
      word if word.length == length
    end
  end

  def handle_response(guess, index_array)

    @candidate_words.reject! do |word|
      should_delete = false

      word.split("").each_with_index do |letter, index|
        if (letter == guess) && (!index_array.include?(index))
          should_delete = true
          break
        elsif (letter != guess) && (index_array.include?(index))
          should_delete = true
          break
        end
      end

      should_delete
    end

  end

  def require_secret
    @secret_word
  end

  def guess(board)

    p @candidate_words

    freq_table = freq_table(board)

    most_frequent_letters = freq_table.sort_by { |letter, count| count }

    letter, _ = most_frequent_letters.last
    # p letter
    # p _

    letter
  end

  def freq_table(board)

    freq_table = Hash.new(0)
    @candidate_words.each do |word|
      board.each_with_index do |letter, index|

        freq_table[word[index]] += 1 if letter.nil?
      end
    end

    freq_table
  end
end