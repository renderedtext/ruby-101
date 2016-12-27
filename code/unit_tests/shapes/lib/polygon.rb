#!/usr/bin/env ruby

# Classes of polygons

module Shapes
  module PolygonOperations
    def check_params(*param)
      param.each do |p|
        raise ArgumentError, "Parameter(s) cannot be negative or zero." if p.to_f <= 0
      end
    end
    def perimeter
      self.sides * @a
    end

    def to_s
      "Shape: #{self.shape} (#{self.sides} sides)\nPerimeter: #{self.perimeter}\nArea: #{self.area}"
    end
  end


  class Pentagon
    include PolygonOperations

    def initialize(a: 0)
      check_params(a)
      @a = a.to_f
    end

    def area
      1.0 / 4.0 * @a * @a * Math.sqrt(5.0 * (5.0 + 2.0 * Math.sqrt(5.0)))
    end

    def shape
      :pentagon
    end

    def sides
      5
    end
  end


  class Hexagon
    include PolygonOperations

    def initialize(a: 0)
      check_params(a)
      @a = a.to_f
    end

    def area
      3.0 * Math.sqrt(3.0) / 2.0 * @a * @a 
    end

    def shape
      :hexagon
    end

    def sides
      6
    end
  end
end
