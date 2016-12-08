#!/usr/bin/env ruby

# Example of reading lines from a file and printing them
if ARGV.empty?
  STDERR.puts "No files provided. Aborting."
  exit 1
end

ARGV.each do |filename|
  puts
  puts "Showing file #{filename}:"
  file = File.open(filename)
  file.each.with_index { |line, num| puts "#{num}:\t#{line}" }
end
