#!/usr/bin/env ruby

# Example of working with files using iteration

puts "Displaying file, character by character:"

# Iterating byte by byte (octets)
File.open("example.txt", "r") do |file|
  file.each_byte.with_index do |char, index|
    puts if index % 6 == 0
    output = char.chr
    # Prettify text output and fix visual glitch when outputting \n
    case char
    when 10, 13
      output.replace("⏎") # new line
    when 32
      output.replace("␣") # space
    end
    printf("%-4s %-6s", output, char)
    # Don't add the vertical bar to the last column:
    print("|  ") unless index % 6 == 5
    #~ break if index > 15   # stop after 15th character
  end
end

print "\n\n\nNow, displaying file, line by line:\n\n"

# Iterating line by line
File.open("example.txt", "r") do |file|
  file.each_line.with_index do |line, index|
    printf("%02d: %s", index + 1, line)
  end
end

# Iterating using IO class directly (read from start by default)
print "\n\n\nOnce again, displaying file:\n\n"
IO.foreach("example.txt") { |line| puts line }
