#!/usr/bin/env ruby

# Example of catching and handling exceptions

a = 0
puts "Let's see what happens when we divide by zero."

begin
  print "Division result: ", 2 / a
  puts
rescue ZeroDivisionError => mistake
  puts "Error: #{mistake}"
  a = 2
  "Let's try to recover."
  puts "Let's see what happens when we divide by two."
  retry
else
  puts "Everything went well."
ensure
  puts "Everything is done."
end
