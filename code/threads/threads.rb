#!/usr/bin/env ruby

# Example of using threads and mutexes


# Example 1: getting web site responses

require 'net/http'

pages = [ 'www.google.com', 'www.slashdot.com', 'www.osnews.com' ]
print "Fetching some web page responses...\n"

# Create a thread for each site we want to access
threads = pages.map do |page_to_get|
  # Since threads share all variables with the environment they are
  # created in, and we don't want to cause collision (one thread
  # changing value of a variable while another one is accessing it),
  # we pass what we need as parameters in .new(param, param), since
  # variables within the code block are local to the thread
  Thread.new(page_to_get) do |url|
    http = Net::HTTP.new(url, 80)
    print "Getting page response from #{url}\n"
    response = http.get('/')
    print "#{url}: #{response.message}\n"
  end
end

# Start executing the threads
threads.each {|thr| thr.join }
puts "Finished."
3.times { puts }
sleep(0.5)


# Example 2: threads racing for some candy :D 
sweets = ['cookies', 'jelly', 'chocolate', 'candy', 'cake']
print "Threads are racing for some candy now...\n"

threads2 = sweets.map.with_index do |sweet, index|
  Thread.new(sweet, index) do |piece, i|
    print("Hey, it's thread no. #{i}, I have some #{sweet}!\n")
  end
end

#~ puts Thread.list
threads2.each { |thread| thread.join }
puts "Done with sharing candy."
3.times { puts }
sleep(0.5)


# Example 3: threads that last for unpredictable amount of time each
count = 0

print <<LOL
Now, some counting with 10 threads running for unpredictable time each.

LOL

threads3 = 10.times.map do |i|
  Thread.new do
    sleep(rand(0.1))
    Thread.current[:mycount] = count
    count += 1
  end
end
threads3.each {|t| t.join; print t[:mycount], ", " }
puts "\b\b.\nCount: #{count}"
puts "Finished counting."
3.times { puts }
sleep(0.5)


# Example 4: mutexes
sum = 0
mutex = Mutex.new
print <<LOL
Now, a mutex will control the access to variables and make sure no
racing conditions occur while 10 threads execute simultaneously.
LOL

threads4 = 10.times.map do
  Thread.new do
    100000.times do
      mutex.synchronize do
        new_value = sum + 1
        print "#{new_value}, " if new_value % 250000 == 0
        sum = new_value
      end
    end
  end
end

threads4.each(&:join)
print "\b\b.\nSum = #{sum}\n"
puts "That would be all. Have a nice day. :)"
