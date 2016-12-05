#!/usr/bin/env ruby

# Get the current date and time, use the Time class
today = Time.now

# Let's check if it's weekend, and say the appropriate message
if today.saturday?
  puts "Let me remind you, you should clean around the house."
elsif today.sunday?
  puts "It is time to relax. Get some good rest."
else
  puts "Get ready for work."
end
