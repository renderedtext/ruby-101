#!/usr/bin/env ruby

# Example of using Enumerators on collections (arrays and hashes)

array = [2, 4, 6, 8, "doge", "cate", "mouse"]
hash = { dog: "Toby", cat: "Munchkin", mouse: "Tutchell" }

# Create enumerators
enum_a = array.to_enum
enum_h = hash.to_enum

# Another way of doing the same
# enum_a = array.each
# enum_h = hash.each

# Show us the enumerators
p enum_a
p enum_h

# Get consecutive elements from the enumerators
p enum_a.next
p enum_a.next
p enum_a.next

p enum_h.next
p enum_h.next
p enum_h.next


# Try some looping
fruits = [ 'apple', 'orange', 'banana', 'kiwi' ]
colors = [ 'red', 'orange', 'yellow', 'brown', 'green', 'white']
fruits_enum = fruits.to_enum
colors_enum = colors.to_enum

puts
puts "Looping time with two enumerators called in parallel:"

loop do
  puts "#{fruits_enum.next} - #{colors_enum.next}"
end

puts "Finished looping."


# Working on words
result = []
"rendezvous".each_char.each_with_index do |letter, index|
  result.push([letter, index])
end

p result


# Looping with hashes
food = Hash.new('none')

['apple', 'pie', 'burger', 'sandwich'].each_with_index do |item, index|
  food.store(index, item)
end

p food
