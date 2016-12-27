#!/usr/bin/env ruby

# Classes of circle

module Shapes
  class Circle
    def initialize(r: 0)
      raise ArgumentError, "Radius cannot be negative or zero." if r.to_f <= 0
      @r = r.to_f
    end

    def radius
      @r
    end

    def area
      @r * @r * Math::PI
    end

    def perimeter
      2 * @r * Math::PI
    end

    def shape
      :circle
    end

    def to_s
      "Shape: #{shape}\nRadius: #{@r}\nPerimeter: #{perimeter}\nArea: #{area}"
    end
  end
end
