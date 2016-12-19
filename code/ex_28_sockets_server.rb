#!/usr/bin/env ruby

# Example of using sockets and network resources - server

require 'socket'
port = 12345
buff_max = 200

server = TCPServer.new(port)    # Server bound to port 2000

loop do
  client = server.accept        # Wait for a client to connect
  client.puts "Hello from the server!"
  loop do
    client.print "Command [bye/sing/dance]? "
    msg, sender = client.recvfrom(buff_max)
    case msg.downcase
    when msg == "bye"
      client.puts "Bye bye!"
      break
    when msg == "sing"
      client.puts "I'm singing in the rain... :D"
    when msg == "dance"
      client.puts "I'm not really good at dancing, you know... :D"
    end
  end
end

client.close
  #~ msg, sender = socket.recvfrom(buff_max)
  #~ break if msg == "bye"
  #~ host = sender[3]
  #~ puts "#{Time.now}: #{host} '#{msg}'"
  #~ STDOUT.flush

#~ loop do
  #~     # Wait for a client to connect
  #~ client.puts "Hello !"
  #~ client.puts "Time is #{Time.now}"
  #~ client.close
#~ end

# Simple logger prints messages received on UDP port 12121
#~ require 'socket'
#~ socket = UDPSocket.new
#~ socket.bind("127.0.0.1", 12121)

