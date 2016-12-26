#!/usr/bin/env ruby

require_relative '../lib/circle.rb'
require_relative '../lib/four_sided.rb'
require_relative '../lib/polygon.rb'
require_relative '../lib/runner.rb'
require_relative '../lib/triangle.rb'


module Shapes
  class Runner
    def initialize(args)
      @args = args
    end

    def run
      show_usage_exit if @args.length < 2
      shape = @args.shift.downcase.to_sym

      case @args.length
      when 1
        case shape
        when :circle
          puts Shapes::Circle.new(r: @args.shift.to_f)
        when :pentagon
          puts Shapes::Pentagon.new(a: @args.shift.to_f)
        when :hexagon
          puts Shapes::Hexagon.new(a: @args.shift.to_f)
        when :square
          puts Shapes::Square.new(a: @args.shift.to_f)
        else
          show_usage_exit
        end
        exit 0
      when 2
        case shape
        when :rectangle
          puts Shapes::Rectangle.new(a: @args[0].to_f, b: @args[1].to_f)
        when :rhombus
          puts Shapes::Rhombus.new(a: @args[0].to_f, h: @args[1].to_f)
        else
          show_usage_exit
        end
        exit 0
      when 3
        case shape
        when :triangle
          puts Shapes::Triangle.new(a: @args[0].to_f, b: @args[1].to_f, c: @args[2].to_f)
        when :parallelogram
          puts Shapes::Parallelogram.new(a: @args[0].to_f, b: @args[1].to_f, h: @args[2].to_f)
        else
          show_usage_exit
        end
        exit 0
      when 5
        if shape == :trapezoid
          puts Shapes::Trapezoid.new(a: @args[0].to_f, b: @args[1].to_f, c: @args[2].to_f, d: @args[3].to_f, h: @args[4].to_f)
          exit 0
        end
      end
      show_usage_exit
    end

    def show_usage_exit
      name = File.basename($0, File.extname($0))
      puts <<-HELP
Geometrical shape area and perimeter calculator
Copyright (c) 2016 Filip Dimovski, all rights reserved. Licensed under GPL3.

Usage: #{name} shape [parameter(s)]...

Shape:          Parameter:
circle          r
pentagon        a
hexagon         a
square          a
rectangle       a b
rhombus         a h
triangle        a b c
parallelogram   a b h
trapezoid       a b c d h

r - radius, h - height, a, b, c, d - sides
HELP
      exit 1
    end

  end
end
