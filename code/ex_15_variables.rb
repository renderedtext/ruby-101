#!/usr/bin/env ruby

# Example of inspecting variables and references

dog = "Toby"
puts "Variable name: dog"
puts "Type of object: #{dog.class}"
puts "Object ID: #{dog.object_id}"
puts "Value: #{dog}"
puts

hound = dog
dog[0] = 'R'
puts "Hounds's name is #{hound}."
puts "Dog's name is #{dog}."
puts

puts "Variable name: hound"
puts "Type of object: #{hound.class}"
puts "Object ID: #{hound.object_id}"
puts "Value: #{hound}"
puts
