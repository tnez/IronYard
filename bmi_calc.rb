# BMI_CALC
################################################################################
# A program to calculate Body Mass Index
# (http://en.wikipedia.org/wiki/Body_mass_index). Enter height in feet followed
# by inches, and get your BMI!
################################################################################

# Display welcome message
puts # newline for readability
puts "Welcome to BMI_CALC"
puts "-------------------"
puts "Follow the prompts to enter your weight in lbs,"
puts "height in feet, height in inches to get your BMI!"


# get weight
puts
print "Enter your weight (lbs): "
weight = gets.chomp.to_f

# get height
puts
print "Enter your height (feet component): "
height_f = gets.chomp.to_i
print "Enter your height (inches component): "
height_i = gets.chomp.to_f # use to_f to accom. halves and such
# combine feet and inches components
height = height_f * 12 + height_i

# calculate BMI
bmi = ( weight / height**2 ) * 703.0

# return BMI
puts
puts "Your BMI is: #{bmi.round(1)}"
puts 
