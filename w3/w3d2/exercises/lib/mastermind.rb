require 'byebug'
class Code
  attr_accessor :pegs

  def initialize(pegs)
    @pegs = pegs
  end

  PEGS = { 'b' => :blue,
  'r' => :red,
  'g' => :green,
  'y' => :yellow,
  'o' => :orange,
  'p' => :purple, }

  def self.parse(peg_string)
    # peg_array = []
    # peg_string.each_char.with_index(0) do |char, i|
    #   if PEGS.has_key?(char.downcase)
    #     peg_array[i] = PEGS[char.downcase]
    #   else
    #     raise 'An error has occured'
    #   end
    # end
    #
    # Code.new(peg_array)
    # factory method
    pegs = peg_string.split("").map do |letter|
      raise "parse error" unless PEGS.has_key?(letter.downcase)

      PEGS[letter.downcase]
    end

    Code.new(pegs)
  end

  def self.random
    p peg_rand = PEGS.values.sample(4)

    Code.new(peg_rand)
  end

  def exact_matches(user_pegs)
    exact_matches = 0
    @pegs.each.with_index do |color, i|
      exact_matches += 1 if user_pegs[i] == color
    end

    exact_matches
  end

  def near_matches(other_code)
    other_color_counts = other_code.color_counts

    near_matches = 0
    self.color_counts.each do |color, count|
      next unless other_color_counts.has_key?(color)

      # Give credit for near matches up to `count`
      near_matches += [count, other_color_counts[color]].min
    end

    near_matches - self.exact_matches(other_code)  end

  def [](i)
    @pegs[i]
  end

  def ==(rand_code)
    return false unless rand_code.is_a?(Code)

    @pegs == rand_code.pegs
  end

  protected

  def color_counts
    color_counts = Hash.new(0)

    @pegs.each do |color|
      color_counts[color] += 1
    end

    color_counts
  end

end

class Game
  attr_reader :secret_code
  TURNS = 10

  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end

  def play

    TURNS.times do

      peg_array = get_guess

      if peg_array == @secret_code
        p "you win!"
        return
      end

      display_matches(peg_array)
    end

    puts "game over"
  end

  def get_guess
    puts "Guess the code:"
    Code.parse(gets(4).chomp)
  end

  def display_matches(user_pegs)
    num_exact_matches = @secret_code.exact_matches(user_pegs)
    num_near_matches = @secret_code.near_matches(user_pegs)

    p "#{num_exact_matches} of exact matches"
    p "#{num_near_matches} of near matches"
  end


end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end





