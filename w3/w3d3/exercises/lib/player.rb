class HumanPlayer

  def initialize(name)
    @name = name
  end

  def get_play
    gets.chomp.split(",").map {|num| Integer(num)}
  end

  def prompt
    p "enter target coordinates (2,3)"
  end
end
