#!/usr/bin/env ruby

# Hand-made integration test for the 'shapes' tool
# Using Test::Unit and Shoulda

require 'test/unit'
require 'shoulda'

$binary_path = "../bin/shapes"

class TestShapes < Test::Unit::TestCase

$binary_path = "../bin/shapes"

  context "circle" do
    results = { 1.0   => { p: 6.283185307179586, a: 3.141592653589793 },
                7.14  => { p: 44.86194309326224, a: 160.15713684294622 },
                99.0  => { p: 622.0353454107791, a: 30790.74959783356 }
              }
    results.each do |param, result|
      should "should be #{result} for #{param}" do
        output = "Shape: circle\nRadius: #{param}\nPerimeter: #{result[:p]}\nArea: #{result[:a]}"
        assert_equal output, `#{$binary_path} circle #{param}`.chomp
      end
    end
  end

  context "pentagon" do
    results = { 1.0   => { p: 5.0, a: 1.720477400588967 },
                7.14  => { p: 35.699999999999996, a: 87.7092496910653 },
                99    => { p: 495.0, a: 16862.399003172464 }
              }
    results.each do |param, result|
      should "should be #{result} for #{param}" do
        output = "Shape: pentagon (5 sides)\nPerimeter: #{result[:p]}\nArea: #{result[:a]}"
        assert_equal output, `#{$binary_path} pentagon #{param}`.chomp
      end
    end
  end

  context "hexagon" do
    results = { 1.0   => { p: 6.0, a: 2.598076211353316 },
                7.14  => { p: 42.839999999999996, a: 132.4488860243075 },
                99    => { p: 594.0, a: 25463.74494747385 } 
              }
    results.each do |param, result|
      should "should be #{result} for #{param}" do
        output = "Shape: hexagon (6 sides)\nPerimeter: #{result[:p]}\nArea: #{result[:a]}"
        assert_equal output, `#{$binary_path} hexagon #{param}`.chomp
      end
    end
  end

  context "square" do
    results = { 1.0   => { p: 4.0, a: 1.0 },
                7.14  => { p: 28.56, a: 50.9796 },
                99    => { p: 396.0, a: 9801.0 }
              }
    results.each do |param, result|
      should "should be #{result} for #{param}" do
        output = "Shape: square (4 sides)\nPerimeter: #{result[:p]}\nArea: #{result[:a]}"
        assert_equal output, `#{$binary_path} square #{param}`.chomp
      end
    end
  end

  context "rectangle" do
    results = { [17, 24]      => { p: 82.0, a: 408.0 },
                [46.7, 99.34] => { p: 292.08000000000004, a: 4639.178000000001 }
              }
    results.each do |param, result|
      should "should be #{result} for #{param}" do
        output = "Shape: rectangle (4 sides)\nPerimeter: #{result[:p]}\nArea: #{result[:a]}"
        assert_equal output, `#{$binary_path} rectangle #{param[0]} #{param[1]}`.chomp
      end
    end
  end

  context "rhombus" do
    results = { [17, 24]      => { p: 68.0, a: 408.0 },
                [46.7, 99.34] => { p: 186.8, a: 4639.178000000001 }
              }
    results.each do |param, result|
      should "should be #{result} for #{param}" do
        output = "Shape: rhombus (4 sides)\nPerimeter: #{result[:p]}\nArea: #{result[:a]}"
        assert_equal output, `#{$binary_path} rhombus #{param[0]} #{param[1]}`.chomp
      end
    end
  end

  context "parallelogram" do
    results = { [17, 24, 10]          => { p: 82.0, a: 170.0 },
                [46.7, 99.34, 12.78]  => { p: 292.08000000000004, a: 596.826 }
              }
    results.each do |param, result|
      should "should be #{result} for #{param}" do
        output = "Shape: parallelogram (4 sides)\nPerimeter: #{result[:p]}\nArea: #{result[:a]}"
        assert_equal output, `#{$binary_path} parallelogram #{param[0]} #{param[1]} #{param[2]}`.chomp
      end
    end
  end

  context "triangle" do
    results = { [17, 24, 10]          => { p: 51.0, a: 70.98899562608278 },
                [3, 4, 5]             => { p: 12.0, a: 6.0 },
                [46.7, 27.34, 52.78]  => { p: 126.82000000000001, a: 637.3922886610021 }
              }
    results.each do |param, result|
      should "should be #{result} for #{param}" do
        output = "Shape: "
        if param == [3, 4, 5]
          output << "right"
        else
          output << "scalene"
        end
        output << " triangle (3 sides)\nPerimeter: #{result[:p]}\nArea: #{result[:a]}"
        assert_equal output, `#{$binary_path} triangle #{param[0]} #{param[1]} #{param[2]}`.chomp
      end
    end
  end

  context "trapezoid" do
    results = { [17, 24, 10, 3, 11]                 => { p: 54.0, a: 225.5 },
                [46.7, 27.34, 52.78, 31.2, 27.33]   => { p: 158.02, a: 1011.7566 }
              }
    results.each do |param, result|
      should "should be #{result} for #{param}" do
        output = "Shape: trapezoid (4 sides)\nPerimeter: #{result[:p]}\nArea: #{result[:a]}"
        assert_equal output, `#{$binary_path} trapezoid #{param[0]} #{param[1]} #{param[2]} #{param[3]} #{param[4]}`.chomp
      end
    end
  end

  context "crash-test" do
    should "should show error message" do
      error_msg = "The shape you entered and its parameters are incorrect."
      error_triangle = "The sum of two sides cannot be less than or equal to third side. Impossible triangle."
      
      assert_equal error_msg, `#{$binary_path} circle 3 4`.chomp
      assert_equal error_triangle, `#{$binary_path} triangle 3 4 99`.chomp
      assert_equal error_msg, `#{$binary_path} square horse`.chomp
    end
  end

end
