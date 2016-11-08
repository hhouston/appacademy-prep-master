class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board)
    @player = player
    @board = board
    @hit = false
  end

  def attack(pos)
    if board[pos] == :s
      @hit = true
    else
      @hit = false
    end

    @board[pos] = :x
  end

  def hit?
    @hit
  end

  def count
    @board.count
  end

  def game_over?
    board.won?
  end

  def valid_play?(pos)
    pos.is_a?(Array) && board.in_range?(pos)
  end

  def play
    play_turn until game_over?
    declare_winner
  end

  def play_turn
    pos = nil
    until valid_play?(pos)
      display_status
      pos = @player.get_play
    end

    attack(pos)
  end

  def declare_winner
    p "You win!"
  end

  def display_status
    board.display
    puts "It's a hit!" if hit?
    puts "There are #{count} ships remaining."
  end

end


if __FILE__ == $PROGRAM_NAME
  BattleshipGame.new.play
end