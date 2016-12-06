#!/usr/bin/env ruby

# Example of working with while-loops

square = 2

while square < 100000
  print "#{square}, "
  square = square ** 2
end

puts "\b\b.\n\n"


# Show even numbers from 2 to 10
counter = 2

print "The even numbers from 2 to 10 are: "

while counter <= 10
  print "#{counter}, "
  counter += 2  # It means just like in C: counter = counter + 2
end

puts "\b\b."  # Two backspaces, and a dot, to finish the sentence.
