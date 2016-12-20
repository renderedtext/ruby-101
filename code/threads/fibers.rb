#!/usr/bin/env ruby

# Example of using fibers

# A fiber here is used to process a text file and return words
# one by one, as it is resumed

words = Fiber.new do
  File.foreach("ugly_duckling.txt") do |line|
    line.scan(/[\w']+/) do |word|
      Fiber.yield word.downcase
    end
  end
end

# A hash will hold all words and their counts, default count is 0
counts = Hash.new(0)

# Returns words until the list is exhausted, then returns nil and stops
while word = words.resume
  counts[word] += 1
end

# Sort by key, from smallest to biggest, reverse it, put it back to hash
counts = counts.sort_by{ |k, v| v }.reverse.to_h

# Show us only words which are greater than 10 characters
counts.each do |word, count|
  puts "#{word}: #{count}" if count >= 10
end
