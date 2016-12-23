#!/usr/bin/env ruby

# Unit tests for the Complex class

require_relative '../lib/complex.rb'
require 'test/unit'

class RexTestComplexNumber < Test::Unit::TestCase

  def test_definitions
    assert_equal("0.0", Rex::ComplexNumber.new("0.0", "0i").to_s)
    assert_equal("2.0i", Rex::ComplexNumber.new("0", "2i").to_s)
    assert_equal("-17.0-4.0i", Rex::ComplexNumber.new("-17", "-4i").to_s)
  end

  def test_operations
    case1 = Rex::ComplexNumber.new("-17", "-4i")
    case2 = Rex::ComplexNumber.new("0", "2i")

    assert_equal("-17.0-2.0i", (case1 + case2).to_s)
    assert_equal("-17.0-6.0i", (case1 - case2).to_s)
    assert_equal("8.0-34.0i", (case1 * case2).to_s)
    assert_equal("-2.0+8.5i", (case1 / case2).to_s)
  end

  def test_difficult_ops
    case1 = Rex::ComplexNumber.new("-17", "-4i")

    assert_equal("0.48179310734638936-4.151159428194307i", case1.sqrt.to_s)
    assert_equal("-17.0+4.0i", case1.conj.to_s)
    assert_equal("-0.05573770491803279-0.013114754098360656i", case1.recp.to_s)
  end
end
