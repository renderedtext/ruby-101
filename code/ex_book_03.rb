#!/usr/bin/env ruby

# Define an array
a = [17, 3.14, "shoes", "nevertheless", 42]

puts "The array is #{a.inspect}"

# Set the 3rd element
a[2] = "tchotchki"

# Set the 6th element to nil
a[5] = nil

# Set the 8th element
a[7] = 42

# The 7th element will be nil because we did not define it
puts "The array after the changes is #{a.inspect}"

# Define another array using another notation
# But there is a catch - all of these values will be treated as strings,
# numbers included, and the spaces in strings must be escaped if you
# want them to be treated as one element of the array; avoid using
# '' and "" quotes to surround the string or they will become part of it
b = %w{ dog cat 27 342 673.99 just\ in\ case you\ noticed }

puts "Our next given array, by the new notation, is: #{b.inspect}"

# Print the last two elements, to show escaping the strings is needed
puts "Look, '#{b[5]}' and '#{b[6]}' are two separate elements."
