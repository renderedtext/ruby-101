#!/usr/bin/env ruby

# Define a hash of musical instruments and types - alternative notation
instruments = {
  :guitar => 'string',
  :trumpet => 'brass',
  :drum => 'percussion',
  :saxophone => 'brass',
  :violin => 'string'
}

for piece in instruments
  puts "The #{piece[0]} is a #{piece[1]} instrument."
end
