#!/usr/bin/env ruby

# Code block, iterators, and yielding (code block invocation)

# Define a simple method to test yielding
def say_something
  puts "Executing the method. Will yield next."
  yield("Pete", "Hello!")
  yield("Sally", "Woot!")
  puts "Finished yielding."
end

# Call the method and pass the code block to be yielded within
say_something { |person, text| puts "#{person} says '#{text}'." }


# Iterating over an array
print "Here are some animals: "

animals = [ "dog", "cat", "mouse", "duck", "lizzard" ]
animals.each { |animal| print animal, ', ' }  # Interation over an array
puts "\b\b."


# Interating using .times and .upto(num)
20.times { print '* ' }
puts

print "Let's count to 10: "
1.upto(10) { |num| print num, ', ' }
puts "\b\b."


# Iterating over ranges
print "Here are the lowercase letters of the Latin alphabet: "
('a'..'z').each { |letter| print letter, ', ' }
puts "\b\b."

(1..20).each { |digit| print digit, " " }  # Prints numbers from 1 to 20
puts
