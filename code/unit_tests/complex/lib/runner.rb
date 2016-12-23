#!/usr/bin/env ruby

require_relative '../lib/complex.rb'

module Rex
  class Runner
    def initialize(args)
      @args = args
    end

    def run
      show_usage_exit if @args.length < 1 or @args.length > 5
      what_to_do = @args.shift.downcase

      # After shift, @args.length = 4
      # First two arguments are parts of the first complex number
      a = Rex::ComplexNumber.new(@args[0], @args[1]) if @args.length >= 2
      # Next two arguments are parts of the second complex number
      b = Rex::ComplexNumber.new(@args[2], @args[3]) if @args.length == 4

      case @args.length
      when 0
        show_usage_exit
      when 4
        case what_to_do
        when "add", "+"
          puts a + b
        when "sub", "-"
          puts a - b
        when "mul", "*"
          puts a * b
        when "div", "/"
          puts a / b
        else
          show_usage_exit
        end
      when 2
        case what_to_do
        when "conj"
          puts a.conj
        when "recp"
          puts a.recp
        when "sqrt"
          puts a.sqrt
        else
          show_usage_exit
        end
      else
        show_usage_exit
      end
      exit 0
    end

    def show_usage_exit
      name = File.basename($0, File.extname($0))
      puts <<-HELP
Complex number calculator using Reverse Polish Notation
Copyright (c) 2016 Filip Dimovski, all rights reserved. Licensed under GPL3.

Usage: #{name} operation [number] [number]

Re is the real part, Im is the imaginary part of a complex number (without 'i').

Addition:       #{name} add|+ Re1 Im1 Re2 Im2
Subtraction:    #{name} sub|- Re1 Im1 Re2 Im2
Multiplication: #{name} mul|* Re1 Im1 Re2 Im2
Division:       #{name} div|/ Re1 Im1 Re2 Im2

Conjugation:    #{name} conj  Re Im
Reciprocal:     #{name} recp  Re Im
Square root:    #{name} sqrt  Re Im
HELP
      exit 1
    end

  end
end
