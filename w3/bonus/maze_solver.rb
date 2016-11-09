class Maze
  attr_reader :maze_file_name, :maze, :start, :end

  def initialize(maze_file_name)
    @maze_file_name = maze_file_name
    @maze = Array.new(20) { Array.new(20) }
    @start = nil
    @end = nil
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def import_maze
    index = 0
    File.foreach(@maze_file_name) do |line|
      line.each_byte.with_index do |letter, i|

        if letter.chr == "S"
          @start = [index, i]
        elsif letter.chr == "E"
          @end = [index, i]
        end

        @maze[index][i] = letter.chr unless letter.chr == "\n"
      end

      index += 1
    end
  end

  def setup
    import_maze

  end

  def solve_maze
    until @start == @end

      row, col = @start

      if @maze[row][col + 1] != "H" && @maze[row][col + 1] != "*"
        @start = [row, col + 1]
        @maze[row][col + 1] = "H"

      elsif @maze[row - 1][col] != "H" && @maze[row - 1][col] != "*"
        @start = [row - 1, col]
        @maze[row - 1][col] = "H"

      elsif @maze[row + 1][col] != "H" && @maze[row + 1][col] != "*"
        @start = [row + 1, col]
        @maze[row + 1][col] = "H"
      else
        @start = [row, col - 1]
        @maze[row][col - 1] == "H"
      end

      p @start
    end

    row, col = @start
    @maze[row][col] = "E"
  end

  def print_solution
    File.open("maze_solution.txt", "w") do |f|
      f.write @maze.join("\n")
      p @maze
    end
  end

  def start
    setup
    solve_maze
    print_solution
  end
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length == 1
    file_name = ARGV[0]
    @maze = Maze.new(file_name)
    @maze.start
  else
    raise "error: no file given"
  end
end