#!/usr/bin/env ruby

# Unit tests using Test::Unit and Shoulda

require_relative '../lib/complex.rb'
require 'test/unit'
require 'shoulda'

class RexTestComplexNumber < Test::Unit::TestCase

  context "creation" do
    results = { "0.0" => ["0.0", "0i"], "2.0i" => ["0", "2i"], "-17.0-4.0i" => ["-17", "-4i"] }
    results.each do |result, param|
      should "should be #{result} for #{param}" do
        assert_equal result, Rex::ComplexNumber.new(param[0], param[1]).to_s
      end
    end
  end

  context "perform basic arithmetical operations" do
    i1 = Rex::ComplexNumber.new("-17", "-4i")
    i2 = Rex::ComplexNumber.new("0", "2i")
    results1 = [ "-17.0-2.0i", "-17.0-6.0i", "8.0-34.0i", "-2.0+8.5i" ]
    i = 0

    should "return correct result" do
      results1.each do |result|
        assert_equal result, (i1 + i2).to_s if i == 0
        assert_equal result, (i1 - i2).to_s if i == 1
        assert_equal result, (i1 * i2).to_s if i == 2
        assert_equal result, (i1 / i2).to_s if i == 3
        i += 1
      end
    end
  end

  context "perform advanced operations" do
    i3 = Rex::ComplexNumber.new("-17", "-4i")
    results2 = [ "0.48179310734638936-4.151159428194307i", "-17.0+4.0i", "-0.05573770491803279-0.013114754098360656i" ]
    j = 0

    should "return correct result" do
      results2.each do |result|
        assert_equal result, i3.sqrt.to_s if j == 0
        assert_equal result, i3.conj.to_s if j == 1
        assert_equal result, i3.recp.to_s if j == 2
        j += 1
      end
    end
  end

end
