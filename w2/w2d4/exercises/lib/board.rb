require 'byebug'

class Board
  attr_accessor :grid, :winner, :marks

  def self.new_grid
    Array.new(3) { Array.new(3)}
  end

  def initialize(grid = Board.new_grid)
    @grid = grid
    @winner = nil
    @marks = [:X, :O]
  end
  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def empty?(pos)
    row, col = pos

    if grid[row][col] == nil
      true
    else
      false
    end
  end

  def place_mark(pos, mark)
    if empty?(pos)
      row, col = pos
      @grid[row][col] = mark
    end
    over?
  end

  def winner
    if row? == true || col? == true || diag? == true
      @winner
    else
      nil
    end
  end

  def over?
    grid.flatten.none? { |pos| pos.nil? } || winner
  end

  def row?
    (0..2).each do |i|
      x_idx = 0
      o_idx = 0
      (0..2).each do |j|
        if grid[i][j] == :X
          x_idx += 1
          if x_idx == 3
            @winner = :X
            return true
          end
        elsif grid[i][j] == :O
          o_idx += 1
          if o_idx == 3
            @winner = :O
            return true
          end
        end
      end
    end
    false
  end

  def col?
    (0..2).each do |j|
      x_idx = 0
      o_idx = 0
      (0..2).each do |i|
        if grid[i][j] == :X
          x_idx += 1
          if x_idx == 3
            @winner = :X
            return true
          end
        elsif grid[i][j] == :O
          o_idx += 1
          if o_idx == 3
            @winner = :O
            return true
          end
        end
      end
    end
    false
  end

  def diag?
    x_idx = 0
    o_idx = 0
    (0..2).each do |i|
      if grid[i][i] == :X
        x_idx += 1
        if x_idx == 3
          @winner = :X
          return true
        end
      elsif grid[i][i] == :O
        o_idx += 1
        if o_idx == 3
          @winner = :O
          return true
        end
      elsif grid[i][2-i] == :X
        x_idx += 1
        if x_idx == 3
          @winner = :X
          return true
        end
      elsif grid[i][2-i] == :O
        o_idx += 1
          if o_idx == 3
            @winner = :O
            return true
          end
      end
    end
    false
  end
end

# board = Board.new
# #
# board.place_mark([0,0], :O)
# board.place_mark([0,1], :O)
# board.place_mark([0,2], :O)
#
#
# #
# #
# board.over?
# p board.winner
# p board

#
#  place_mark, which takes a position such as [0, 0] and a mark such as :X as arguments. It should throw an error if the position isn't empty.
#  empty?, which takes a position as an argument
#  winner, which should return a mark
#  over?, which should return true or false
#  If you want to be a little fancy, read the attached bracket-methods reading.

# def [](pos)
#   row, col = pos
#   @grid = [row][col]
#   p "[] called"
# end

# def []=(pos, value)
#   row, col = pos
#   @grid[row][col] = value
# end