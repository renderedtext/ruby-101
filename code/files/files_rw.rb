#!/usr/bin/env ruby

# Example of working with files using iteration

require 'stringio'

# Reading whole file into a string
str = IO.read("example2.txt")
puts "Text file. Characters: #{str.chomp!.length}"
puts str.strip.gsub(/\n+/, " ")
puts

# Reading whole file into an array
array = IO.readlines("example2.txt")
array.each.with_index do |line, index|
  print "[Line #{index + 1}, #{line.chomp.length} characters]\n#{line}\n"
end

# Writing to a file
File.open("reverse.txt", "w") do |file|
  array.each do |line|
    file.puts line.chomp.reverse
  end
  puts "These lines have been written in a file, in reverse."
end

# Using StringIO objects
str_in = StringIO.new("Lorem ipsum dolor sit amet.") # To read from
str_out = StringIO.new("", "r+") # Empty StringIO object to write into

print "\nSentence to modify: #{str_in.string}\n"

str_in.each_line do |line|
  str_out.puts line.reverse
end

puts "The sentence in reverse: #{str_out.string}"
