class Horse

  @@max_label_length = 6
  @@horse_length = 10 # 2 + 6 + 2
  @@possible_steps = (1..5).to_a
  
  attr_accessor :label
  attr_accessor :label_short
  attr_accessor :multiplier
  attr_accessor :position
  attr_accessor :racetrack

  def initialize label
    self.label = label
    if self.label.length > @@max_label_length
      self.label_short = self.label[0..@@max_label_length-1]
    else
      self.label_short = self.label
    end
    self.multiplier = 1.0
    self.position = 0
  end

  # update position after cycle
  def update_position
    # move either ( 0..5 steps ) * multiplier * tracklength / 80.0
    position_increment = @@possible_steps.sample.to_f * multiplier *
                         self.racetrack.length / 80.0
    proposed_position = self.position + position_increment
    # check that we have not gone past our finish line... if so we
    # need to stop there (otherwise it looks all uglies)
    if proposed_position + self.length > self.racetrack.length
      self.position = self.racetrack.length - self.length
    else
      self.position = proposed_position
    end
  end

  # output horse as string
  def print
    "~/" + self.label_short.center(@@max_label_length,"=") + "\\^"
  end

  # output the horse length
  def length
    @@horse_length
  end
  
end
