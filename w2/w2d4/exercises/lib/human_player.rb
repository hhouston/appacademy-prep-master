# display should print the board out to the console
# get_move should allow the player to enter a move of the form '0, 0', and return it as a position of the form [0, 0]
class HumanPlayer
  attr_accessor :mark
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_move
    puts "Where would you like to move? (row, col)"
    move = gets.chomp

    pos = move.split(",").map do |i|
      i.to_i
    end
    pos
  end

  def display(board)
    row0 = "0 |"
    (0..2).each do |col|
      row0 << (board.empty?([0, col]) ? "   |" : " " + board[[0, col]].to_s + " |")
    end
    row1 = "1 |"
    (0..2).each do |col|
      row1 << (board.empty?([1, col]) ? "   |" : " " + board[[1, col]].to_s + " |")
    end
    row2 = "2 |"
    (0..2).each do |col|
      row2 << (board.empty?([2, col]) ? "   |" : " " + board[[2, col]].to_s + " |")
    end

    puts row0
    puts "  |-----------|"
    puts row1
    puts "  |-----------|"
    puts row2
  end
end
# board = [[nil,nil,:O],[nil,nil,:O], [nil,nil,:O]]
# human = HumanPlayer.new("hunter")
# human.display(board)