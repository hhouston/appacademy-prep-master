# A Board class with an underlying grid (a two-dimensional Array), where each element in a row represents a ship, open water, or a space that has already been attacked. I used the symbol :s to represent an undamaged ship (or ship segment), nil for empty space, and :x to represent a destroyed space. Useful Board methods:  Board#display: prints the board, with marks on any spaces that have been fired upon.
# Board#count: returns the number of valid targets (ships) remaining
# Board#populate_grid to randomly distribute ships across the board
# Board#in_range?(pos)
class Board
  attr_reader :grid

  def self.default_grid
    Array.new(10) { Array.new(10) }
  end

  def count
    @grid.flatten.select {|spot| spot == :s}.length
  end

  def initialize (grid = self.class.default_grid)
    @grid = grid
  end

  def in_range(pos)
    pos.all? { |x| x.between?(0, grid.length - 1) }
  end

  def display
    p @grid
  end

  def won?
    @grid.flatten.none? { |ship| ship == :s}
  end

  def empty?(pos = nil)
    if pos
      self[pos].nil?
    else
      count == 0
    end
  end

  def full?
    @grid.each do |array|
      array.each do |spot|
        if spot.nil?
          false
          return
        end
      end
    end
    true
  end

  def place_random_ship
    raise "error: gril full" if full?

    pos = random_pos
    until empty?(pos)
      pos = random_pos
    end

      self[pos] = :s

  end

  def random_pos
    rand = Random.new
    col = rand(@grid.first.length-1)
    row = rand(@grid.count-1)
    pos = [col,row]
    pos
  end

  def in_range?(pos)
    pos.all? { |p| p.between?(0, @grid.length - 1)}
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

end