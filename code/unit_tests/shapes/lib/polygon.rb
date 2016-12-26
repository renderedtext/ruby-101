#!/usr/bin/env ruby

# Classes of polygons

module Shapes
  module PolygonOperations
    def perimeter
      self.sides * a
    end

    def to_s
      "Shape: #{self.shape} (#{self.sides} sides)\nPerimeter: #{self.perimeter}\nArea: #{self.area}"
    end
  end


  class Pentagon
    include PolygonOperations
    attr_accessor :a

    def initialize(a: 0)
      self.a = a
    end

    def area
      1.0 / 4.0 * a * a * Math.sqrt(5.0 * (5.0 + 2.0 * Math.sqrt(5.0)))
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
    attr_accessor :a

    def initialize(a: 0)
      self.a = a
    end

    def area
      3.0 * Math.sqrt(3.0) / 2.0 * a * a 
    end

    def shape
      :hexagon
    end

    def sides
      6
    end
  end
end
