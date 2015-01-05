x = 5
name = "Travis Nesland"
phone_number = "859-955-0007"
email = "tnesland@gmail.com"
github = "tnez"
age = 32
is_awesome = true
dog_name = 'Harvey Birdman'

# print x
# print ' '
# puts x.class

# puts name
# puts phone_number
# puts email

if is_awesome
  puts "This dude is awesome"
else
  puts "This dude is !awesome"
end

age_parameter = 26
if age > age_parameter
  puts "Greater than " + age_parameter.to_s
else
  puts "Not greater than " + age_parameter.to_s
end

if name != dog_name
  puts "Human"
else
  puts "Dog"
end

puts "Input foo:"
foo = gets.chomp

puts "User said:"
puts foo
