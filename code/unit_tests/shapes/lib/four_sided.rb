#!/usr/bin/env ruby

# Classes of four-sided geometrical shapes

module Shapes
  module FourSidedOperations
    def area
      self.a * self.b
    end

    def perimeter
      2 * (self.a + self.b)
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
    attr_accessor :a, :b

    def initialize(a: 0, b: 0)
      self.a, self.b = a, b
    end

    def diagonal
      Math.sqrt((a * a) + (b * b))
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
    attr_accessor :a, :b, :h

    def initialize(a: 0, b: 0, h: 0)
      self.a, self.b, self.h = a, b, h
    end

    def area
      a * h
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
    attr_accessor :a, :b, :c, :d, :h

    def initialize(a: 0, b: 0, c: 0, d: 0, h: 0)
      self.a, self.b, self.c, self.d, self.h = a, b, c, d, h
    end

    def area
      (a + b) / 2 * h
    end

    def perimeter
      a + b + c + d
    end

    def shape
      :trapezoid
    end
  end
end
