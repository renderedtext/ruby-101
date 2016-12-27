#!/usr/bin/env ruby

# Classes of triangles

module Shapes
  class Triangle
    def initialize(a: 0, b: 0, c: 0)
      @a, @b, @c = a.to_f, b.to_f, c.to_f
      raise ArgumentError, "Parameter(s) cannot be negative or zero." unless @a > 0 or @b > 0 or @c > 0
      raise ArgumentError, "The sum of two sides cannot be less than or equal to third side. Impossible triangle." if @a + @b < @c or @a + @c < @b or @b + @c < @a
      return @a, @b, @c
    end

    def area
      # Equilateral triangle:
      return Math.sqrt(3.0) / 4.0 * (@a ** 2) if @a == @b and @b == @c
      # Right triangle:
      return @a * @b / 2.0 if right?

      semi = (@a + @b + @c) / 2.0
      Math.sqrt(semi * (semi - @a) * (semi - @b) * (semi - @c))
    end

    def perimeter
      @a + @b + @c
    end

    def sides
      3
    end

    def right?
      return true if @c ** 2 == @a ** 2 + @b ** 2
      false
    end

    def shape
      if @a == @b
        if @b == @c
          return :equilateral
        else
          return :isosceles
        end
      end
      return :right if right?
      :scalene
    end

    def to_s
      "Shape: #{shape} triangle (#{sides} sides)\nPerimeter: #{perimeter}\nArea: #{area}"
    end
  end
end
