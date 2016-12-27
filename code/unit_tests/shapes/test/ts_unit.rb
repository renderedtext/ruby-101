#!/usr/bin/env ruby

# Unit tests for the Shapes classes

require_relative '../lib/runner.rb'
require 'test/unit'

class TestShapes < Test::Unit::TestCase

  def test_circle
    results = { 1.0   => { p: 6.283185307179586, a: 3.141592653589793 },
                7.14  => { p: 44.86194309326224, a: 160.15713684294622 },
                99    => { p: 622.0353454107791, a: 30790.74959783356 }
              }
    results.each do |param, result|
        assert_equal result[:p], Shapes::Circle.new(r: param).perimeter
        assert_equal result[:a], Shapes::Circle.new(r: param).area
    end
  end

  def test_pentagon
    results = { 1.0   => { p: 5.0, a: 1.720477400588967 },
                7.14  => { p: 35.699999999999996, a: 87.7092496910653 },
                99    => { p: 495.0, a: 16862.399003172464 }
              }
    results.each do |param, result|
        assert_equal result[:p], Shapes::Pentagon.new(a: param).perimeter
        assert_equal result[:a], Shapes::Pentagon.new(a: param).area
    end
  end

  def test_hexagon
    results = { 1.0   => { p: 6.0, a: 2.598076211353316 },
                7.14  => { p: 42.839999999999996, a: 132.4488860243075 },
                99    => { p: 594.0, a: 25463.74494747385 } 
              }
    results.each do |param, result|
      assert_equal result[:p], Shapes::Hexagon.new(a: param).perimeter
      assert_equal result[:a], Shapes::Hexagon.new(a: param).area
    end    
  end

  def test_square
    results = { 1.0   => { p: 4.0, a: 1.0 },
                7.14  => { p: 28.56, a: 50.9796 },
                99    => { p: 396.0, a: 9801.0 }
              }
    results.each do |param, result|
        assert_equal result[:p], Shapes::Square.new(a: param).perimeter
        assert_equal result[:a], Shapes::Square.new(a: param).area
    end
  end

  def test_rectangle
    results = { [17, 24]      => { p: 82.0, a: 408.0 },
                [46.7, 99.34] => { p: 292.08000000000004, a: 4639.178000000001 }
              }
    results.each do |param, result|
      assert_equal result[:p], Shapes::Rectangle.new(a: param[0], b: param[1]).perimeter
      assert_equal result[:a], Shapes::Rectangle.new(a: param[0], b: param[1]).area
    end
  end

  def test_rhombus
    results = { [17, 24]      => { p: 68.0, a: 408.0 },
                [46.7, 99.34] => { p: 186.8, a: 4639.178000000001 }
              }
    results.each do |param, result|
      assert_equal result[:p], Shapes::Rhombus.new(a: param[0], h: param[1]).perimeter
      assert_equal result[:a], Shapes::Rhombus.new(a: param[0], h: param[1]).area
    end
  end

  def test_parallelogram
    results = { [17, 24, 10]          => { p: 82.0, a: 170.0 },
                [46.7, 99.34, 12.78]  => { p: 292.08000000000004, a: 596.826 }
              }
    results.each do |param, result|
      assert_equal result[:p], Shapes::Parallelogram.new(a: param[0], b: param[1], h: param[2]).perimeter
      assert_equal result[:a], Shapes::Parallelogram.new(a: param[0], b: param[1], h: param[2]).area
    end
  end

  def test_triangle
    results = { [17, 24, 10]          => { p: 51.0, a: 70.98899562608278 },
                [3, 4, 5]             => { p: 12.0, a: 6.0 },
                [46.7, 27.34, 52.78]  => { p: 126.82000000000001, a: 637.3922886610021 }
              }
    results.each do |param, result|
      assert_equal result[:p], Shapes::Triangle.new(a: param[0], b: param[1], c: param[2]).perimeter
      assert_equal result[:a], Shapes::Triangle.new(a: param[0], b: param[1], c: param[2]).area
    end
  end

  def test_trapezoid
    results = { [17, 24, 10, 3, 11]                 => { p: 54.0, a: 225.5 },
                [46.7, 27.34, 52.78, 31.2, 27.33]   => { p: 158.02, a: 1011.7566 }
              }
    results.each do |param, result|
      assert_equal result[:p], Shapes::Trapezoid.new(a: param[0], b: param[1], c: param[2], d: param[3], h: param[4]).perimeter
      assert_equal result[:a], Shapes::Trapezoid.new(a: param[0], b: param[1], c: param[2], d: param[3], h: param[4]).area
    end
  end

end
