#!/usr/bin/env ruby

# Classes of circle

module Shapes
  class Circle
    attr_accessor :r

    def initialize(r: 0)
      self.r = r
    end

    def area
      r * r * Math::PI
    end

    def perimeter
      2 * r * Math::PI
    end

    def sides
      :no
    end

    def shape
      :circle
    end

    def to_s
      "Shape: #{shape} (#{sides} sides)\nPerimeter: #{perimeter}\nArea: #{area}"
    end
  end
end
