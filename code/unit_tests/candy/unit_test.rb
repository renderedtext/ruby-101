#!/usr/bin/env ruby

# Unit test for class Sugar

require_relative 'my_class.rb'
require 'test/unit'

class TestSugar < Test::Unit::TestCase
  def test_simple
    # Will it return "candy"?
    assert_equal("candy", Sugar.new("candy").to_s)
  end
end
