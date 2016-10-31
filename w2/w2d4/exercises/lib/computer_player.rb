#display should store the board it's passed as an instance variable, so that get_move has access to it
#get_move should return a winning move if one is available, and otherwise move randomly.

class ComputerPlayer
  attr_accessor :board, :mark
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    moves = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = row,col
        moves << pos if board[pos].nil?
      end
    end

    moves.each do |pos|
      return pos if wins?(pos)
    end

    moves.sample
  end

  def wins?(pos)
    board[pos] = mark
    if board.winner == mark
      board[pos] = nil
      true
    else
      board[pos] = nil
      false
    end
  end

end
