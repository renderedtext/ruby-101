#!/usr/bin/env ruby

# Example of variable number of method parameters

def say_hello(*names)
  # 'names' will be an array holding zero or more parameters

  # Complain about no names given
  if names.length == 0
    puts "Give me a name first!"
    return
  end

  print "Hello to "
  for i in 0...names.length   # Last array element = length - 1
    print "#{names[i]}, "
  end
  puts "\b\b."
end

# Prints: "Give me a name first!"
say_hello
# Prints: "Hello to Rex."
say_hello('Rex')
# Prints: "Hello to Rex, Alex, Martha, Samanta."
say_hello('Rex', 'Alex', 'Martha', 'Samanta')
