#!/usr/bin/env ruby

# Define a hash of musical instruments and their type
instruments = Hash.new
instruments = {
  'guitar' => 'string',
  'trumpet' => 'brass',
  'drum' => 'percussion',
  'saxophone' => 'brass',
  'violin' => 'string'
}

# Show us the hash
puts "This is the hash: #{instruments}\n"

# Define a function to tell the type of instrument, avoid repetition
def tell_type(all_instruments, piece)
  # Print some of the elements
  puts "The #{piece} is of type #{all_instruments[piece]}."
end

tell_type(instruments, "guitar")
tell_type(instruments, "saxophone")
tell_type(instruments, "violin")

puts "\nNow, let's try with a for-in loop.\n"

# Or we can do it using for-in for all the instruments
for piece in instruments
  # It returns an array of two objects, the key and the value
  puts "The #{piece[0]} is of type #{piece[1]}."
end
