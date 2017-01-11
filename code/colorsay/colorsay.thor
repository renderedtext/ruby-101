#!/usr/env ruby

require 'colorize'
class Colorsay < Thor
  desc "hello", "Say hello in color"
  def hello
    puts "Hello".colorize(:red)
    puts "Hello".colorize(:green)
    puts "Hello".colorize(:blue)
  end
end
