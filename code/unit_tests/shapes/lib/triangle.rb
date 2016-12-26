#!/usr/bin/env ruby

# Classes of triangles

module Shapes
  class Triangle
    attr_accessor :a, :b, :c

    def initialize(a: 0, b: 0, c: 0)
      self.a, self.b, self.c = a, b, c
    end

    def area
      # Equilateral triangle:
      return Math.sqrt(3.0) / 4.0 * (a ** 2) if a == b and b == c
      # Right triangle:
      return a * b / 2.0 if c ** 2 == a ** 2 + b ** 2

      s = (a + b + c) / 2.0
      Math.sqrt(s * (s - a) * (s - b) * (s - c))
    end

    def perimeter
      a + b + c
    end

    def sides
      3
    end

    def shape
      if a == b
        if b == c
          return :equilateral
        else
          return :isosceles
        end
      end
      return :right if c ** 2 == a ** 2 + b ** 2
      :scalene
    end

    def to_s
      "Shape: #{shape} triangle (#{sides} sides)\nPerimeter: #{perimeter}\nArea: #{area}"
    end
  end
end
