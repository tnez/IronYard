# Bonus: write the opposite program: you, the user, pick a number
# between 1 and 100. The computer has to guess the number. You tell it
# whether it's too high, too low, or right on after each guess. The
# computer gets five guesses.

# Tell the user a little bit about the game
puts
puts "NUMBER GUESSING GAME (ver 2):"
puts "--------------------"
puts
puts "Choose a number between 1 and 100. I will guess it because"
puts "I am a computer and I haz teh brainz!"
puts "(oh, and I promise I won't peek!)"
puts
puts "Let's Begin!"
puts "-----------"

# get the random number from the user
while true
  print "Choose a number between 1 and 100: "
  num = gets.chomp.to_i
  # We can move on if the number is between 1 and 100, otherwise
  # keep asking until they get it right
  break if num >= 1 && num <= 100
end

# define our search space
lo = 1
hi = 100

# keep track of the guesses
MAX_GUESSES = 100
guesses = 0

# until we have found the correct number, continue to guess
# approximately halfway through the search space
while true
  # make my guess
  guess = lo + ( hi - lo ) / 2
  guesses += 1
  # if I am correct... BOOYAHTIME
  if guess == num
    puts
    puts "I haz teh numbah: #{guess} - It only took me #{guesses} tries!"
    break
  end
  # adjust our seach space
  num > guess ? lo = guess + 1 : hi = guess - 1
  # let the user know what we did guess
  puts "I guess #{guess}... WHAT!? WRONG AGAIN!?"
  # one final check to make sure we don't run crazy with our guess
  # loop
  if guesses >= MAX_GUESSES
    puts
    puts "I am so bad at this game - I give up :-("
    break
  end
end

puts # one final newline for prettiness
