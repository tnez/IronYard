# Create a number guessing game. Game should pick a random number
# between 1 and 100 and ask you for a guess. If the guess is less than
# the number, inform the user and let them guess again. If the guess
# is greater than the number, inform the user and let them guess
# again. If the guess is correct, inform the user and quit.

# Tell the user a little bit about the game
puts
puts "NUMBER GUESSING GAME:"
puts "--------------------"
puts "I have chosen a number between 1 and 100. Guess the number."
puts "If you guess correctly, YOU WIN! If not, I will tell you if"
puts "the correct number is higher or lower than your guess"
puts
puts "Let's Begin!"
puts "-----------"

# pick a random number between 1 and 100
num = rand(1..100)

# keep track of the guesses
MAX_GUESSES = 100
guesses = 0

# run loop
while true
  # prompt the user for their guess
  print "Enter your guess: "
  guess = gets.chomp.to_i
  guesses += 1
  # if the user is correct... they win!
  if guess == num
    puts
    puts "YOU WIN!"
    puts
    break # break out of the run loop
  end
  # ...otherwise, check if higher or lower
  if num > guess
    puts "The correct number is greater than your guess"
  else
    puts "The correct number is less than your guess"
  end
  # if the user has had too many guesses, then inform them that they
  # are very bad and that they lose
  if guesses >= MAX_GUESSES
    puts
    puts "You are very bad at this game. Hence, you lose."
    puts
    break # break out of the run loop
  end
end
