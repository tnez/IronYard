require './horse.rb'

class Racetrack

  attr_accessor :horses
  attr_accessor :length
  attr_accessor :max_num_horses

  def initialize
    self.horses = [ ]
    # make lenght of track equal to the length of the terminal window
    self.length = `tput cols`.to_i
    self.max_num_horses = 8
  end

  # Add a horse to the racetrack
  # Params:
  # +label+:: +String+ label of the horse, should be 6 characters or less
  # +multiplier+:: +Float+ multiplier that determines how fast the
  # horse moves
  def add_horse label
    new_horse = Horse.new( label )
    new_horse.racetrack = self
    self.horses.push( new_horse )
  end
    
  # Clear the terminal and (re)-draw our racetrack
  def draw
    # clear the terminal
    system("clear")
    # draw the top rail
    puts '-' * self.length
    # draw each horse in it's own lane
    self.horses.each do |horse|
      # draw .......all the way up to the position of the horse
      print '.' * horse.position + horse.print
      puts
      # draw the bottom rail
      puts '-' * self.length
    end
  end

  # Returns the winning horse if there is a winner, otherwise return
  # nil
  def winner?
    horses.each do |horse|
      if horse.position + horse.length >= self.length
        return horse
      end
    end
    # ...otherwise no horse is the winner
    return nil
  end

end
