# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi
  attr_reader :towers

  puts 'start game'

  def initialize
    tower1 = [3,2,1]
    tower2 = []
    tower3 = []
    @towers = [tower1,tower2,tower3]
  end

  def play
    while won? != true
      puts 'which tower do you want to select a disc from? (1, 2, or 3): '
      start_tower = gets.to_i - 1
      puts 'which tower do you want to place the disc? (1, 2, or 3): '
      end_tower = gets.to_i - 1

      if valid_move?(start_tower, end_tower)
        p 'valid move'
        move(start_tower, end_tower)
      else
        p 'invalid move'
      end
      render
    end
  end

  def move(start_tower, end_tower)
    @towers[end_tower].push(towers[start_tower].pop)
  end

  def valid_move?(start_tower, end_tower)
    if (!towers[start_tower].empty? && start_tower != end_tower) && (towers[end_tower].empty? || towers[end_tower].last > towers[start_tower].last)
      true
    else
      false
    end
  end

  def render
    puts 'tower 1: ' + towers[0].to_s
    puts 'tower 2: ' + towers[1].to_s
    puts 'tower 3: ' + towers[2].to_s
  end

  def won?
    if towers[1].count == 3 || towers[2].count == 3
      p 'won'
      true
    else
      false
    end
  end

end
# #
# game = TowersOfHanoi.new
# game.play