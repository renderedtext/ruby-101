#!/usr/bin/env ruby

# Example 1: using IO.popen to establish a bidirectional channel through
# pipes to another process and exchange data ttrough standard in/out

IO.popen("figlet", "r+") do |fig|
  fig.write("Hello!")
  fig.write(" How are you doing?")
  fig.close_write
  puts fig.read
end


# Example 2: forking a child process and getting its PID once it ends
fork do
  puts "Child process says Hello! PID: #{$$}"
  exit 72
end

pid2 = Process.wait
puts "Parent process here, child process ended!"
puts "PID: #{pid2}, Exit status: #{$?.exitstatus}"
