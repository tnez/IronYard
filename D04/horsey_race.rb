#
#
################################################################################

require './horse.rb'
require './racetrack.rb'

# create the racetrack
racetrack = Racetrack.new

# describe rules and objective of race
puts 
puts "Welcome to the HorseyRace!"
puts "========================="
puts "You can race up to #{racetrack.max_num_horses} horses on our track!"
puts

# The user may add horses until he is done or we reach the max number
# of horses for this race track
while racetrack.horses.length < racetrack.max_num_horses
  print "Enter the name of a horse to add a new horse (Q when you are finished): "
  horse_name = gets.chomp.to_s
  break if horse_name.upcase == 'Q'  
  racetrack.add_horse( horse_name )
end

# draw the initial track
racetrack.draw

# each time the user enters, update positions of horses and draw the
# track until one of the horses has won
loop do
  puts
  print "Hit enter to move those ponies! (hint: try entering a horses name): "
  input = gets.chomp.to_s
  racetrack.horses.each do |horse|
    if input == horse.label
      horse.multiplier += 1
    end
    horse.update_position
    # p horse
  end
  racetrack.draw
  # Do we have a winner??? If so, we can go ahead and break
  if winner=racetrack.winner?
    puts
    puts "#{winner.label} has won the race!!!"
    break
  end
end
