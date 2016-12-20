#!/usr/bin/env ruby

# Example of using sockets and network resources - server

require "socket"

class Server
  def initialize( port, ip )
    @server = TCPServer.open(ip, port)
    @connections = {}
    @rooms = {}
    @clients = {}
    @connections[:server] = @server
    @connections[:clients] = @clients
    run
  end

  def run
    loop {
      Thread.start(@server.accept) do |client|
        # New thread for every client
        nick_name = client.gets.chomp.to_sym
        @connections[:clients].each do |other_name, other_client|
          if nick_name == other_name || client == other_client
            client.puts "Error: Username already exists. Closing connection."
            Thread.kill self
          end
        end
        puts "#{nick_name} connected, #{client}"
        @connections[:clients][nick_name] = client
        client.puts "Connection established, you may begin a conversation."
        listen_user_messages(nick_name, client)
      end
    }.join
  end

  def listen_user_messages(username, client)
    loop {
      msg = client.gets.chomp
      @connections[:clients].each do |other_name, other_client|
        unless other_name == username
          other_client.puts "#{username.to_s}: #{msg}"
        end
      end
    }
  end
end

Server.new( 3000, "localhost" )
