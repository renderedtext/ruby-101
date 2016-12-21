#!/usr/bin/env ruby

# Unit tests for the Complex class

require_relative 'complex.rb'
require 'test/unit'

class TestComplexNumber < Test::Unit::TestCase

  def test_definitions
    assert_equal("0.0", ComplexNumber.new("0.0", "0i").to_s)
    assert_equal("2.0i", ComplexNumber.new("0", "2i").to_s)
    assert_equal("-17.0-4.0i", ComplexNumber.new("-17", "-4i").to_s)
  end

  def test_operations
    case1 = ComplexNumber.new("-17", "-4i")
    case2 = ComplexNumber.new("0", "2i")

    assert_equal("-17.0-2.0i", (case1 + case2).to_s)
    assert_equal("8.0-34.0i", (case1 * case2).to_s)
  end
end
