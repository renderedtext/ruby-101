#!/usr/bin/env ruby

# Example of creating a simple web server

require 'socket'

server = TCPServer.new 2000

loop do
  # Wait for a client to connect, then return a TCPSocket object
  socket = server.accept

  # Read the Request-Line (first line)
  request = socket.gets

  # Lot the request received to stderr
  STDERR.puts "Request: #{request}"

  response =  "<html><head><title>Test page</title></head>" +
              "<h1>Hello world!</h1>" +
              "<p>Test web page from the simple web server. :)</p>" +
              "</html>\n"

  # We need to include the Content-Type and Content-Length headers
  # to let the client know the size and type of data
  # contained in the response. Note that HTTP is whitespace
  # sensitive, and expects each header line to end with CRLF ("\r\n")
  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/html\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"

  # Print blank line to separate header from response body
  # HTTP protocol requirement
  socket.print "\r\n"

  # Print the response
  socket.print response

  # Close the socket and terminate the connection
  socket.close
end
