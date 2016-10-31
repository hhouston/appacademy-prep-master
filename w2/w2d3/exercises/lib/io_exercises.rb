# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  random_number = Random.rand(1..100)
  number_of_guesses = 0
  guess = 0

  puts "We generated a random number between 1-100."
  while guess != random_number
    print "Guess a number: "
    guess = gets.to_i

    if (guess < random_number)
      puts "#{guess} is too low"
    elsif (guess > random_number)
      puts "#{guess} is too high"
    end
    number_of_guesses += 1
  end

  puts "Correct! It took you #{number_of_guesses} guesses to get the random number: #{random_number}"
end


def shuffle_file(file_name)
  #print file_name
  #puts Dir.pwd
  extension = File.extname(file_name)
  base = File.basename(file_name, ".*")

  contents = File.readlines(file_name)

  File.open("#{base}-shuffled#{extension}", "w") do |f|
    f.puts contents.shuffle
  end
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length == 1
    shuffle_file(ARGV.shift)
  else
    puts "Enter filename: "
    shuffle_file(gets.chomp)
  end
end