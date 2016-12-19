#!/usr/bin/env ruby

# Example of using sockets and network resources - client

require 'socket'

server = TCPSocket.new 'localhost', 12345

loop do
  puts server.gets
end
