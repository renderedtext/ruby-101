#!/usr/bin/env ruby

# Classes of four-sided geometrical shapes

module Shapes
  module FourSidedOperations
    def check_params(*param)
      param.each do |p|
        raise ArgumentError, "Parameter(s) cannot be negative or zero." if p.to_f <= 0
      end
    end
    def area
      @a * @b
    end

    def perimeter
      2 * (@a + @b)
    end

    def sides
      4
    end

    def to_s
      "Shape: #{self.shape} (#{self.sides} sides)\nPerimeter: #{self.perimeter}\nArea: #{self.area}"
    end
  end

  class Rectangle
    include FourSidedOperations

    def initialize(a: 0, b: 0)
      check_params(a, b)
      @a, @b = a.to_f, b.to_f
    end

    def diagonal
      Math.sqrt((@a * @a) + (@b * @b))
    end

    def shape
      :rectangle
    end
  end


  # Square is a kind of a rectangle :)
  class Square < Rectangle
    def initialize(a: 0)
      super(a: a, b: a)
    end

    def shape
      :square
    end
  end


  class Parallelogram
    include FourSidedOperations

    def initialize(a: 0, b: 0, h: 0)
      check_params(a, b, h)
      @a, @b, @h = a.to_f, b.to_f, h.to_f
    end

    def area
      @a * @h
    end

    def shape
      :parallelogram
    end
  end


  # Rhombus is a kind of a parallelogram :)
  class Rhombus < Parallelogram
    def initialize(a: 0, h: 0)
      super(a: a, b: a, h: h)
    end

    def shape
      :rhombus
    end
  end

  class Trapezoid
    include FourSidedOperations

    def initialize(a: 0, b: 0, c: 0, d: 0, h: 0)
      check_params(a, b, c, d, h)
      @a, @b, @c, @d, @h = a.to_f, b.to_f, c.to_f, d.to_f, h.to_f
    end

    def area
      (@a + @b) / 2 * @h
    end

    def perimeter
      @a + @b + @c + @d
    end

    def shape
      :trapezoid
    end
  end
end
