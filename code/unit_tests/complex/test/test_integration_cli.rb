#!/usr/bin/env ruby

# Hand-made integration test for the 'complex' tool
# Using Test::Unit and Shoulda

require 'test/unit'
require 'shoulda'

class RexTestComplexNumber < Test::Unit::TestCase

$binary_path = "../bin/complex"

  context "perform basic arithmetical operations long operators" do
    i1 = { re: "-17", im: "-4i" }
    i2 = { re: "0", im: "2i" }
    results = [ "-17.0-2.0i", "-17.0-6.0i", "8.0-34.0i", "-2.0+8.5i" ]
    i = 0

    should "return correct result" do
      results.each do |result|
        assert_equal result, `#{$binary_path} add #{i1[:re]} #{i1[:im]} #{i2[:re]} #{i2[:im]}`.chomp if i == 0
        assert_equal result, `#{$binary_path} sub #{i1[:re]} #{i1[:im]} #{i2[:re]} #{i2[:im]}`.chomp if i == 1
        assert_equal result, `#{$binary_path} mul #{i1[:re]} #{i1[:im]} #{i2[:re]} #{i2[:im]}`.chomp if i == 2
        assert_equal result, `#{$binary_path} div #{i1[:re]} #{i1[:im]} #{i2[:re]} #{i2[:im]}`.chomp if i == 3
        i += 1
      end
    end
  end

  context "perform basic arithmetical operations short operators" do
    i1 = { re: "-17", im: "-4i" }
    i2 = { re: "0", im: "2i" }
    results = [ "-17.0-2.0i", "-17.0-6.0i", "8.0-34.0i", "-2.0+8.5i" ]
    i = 0

    should "return correct result" do
      results.each do |result|
        assert_equal result, `#{$binary_path} + #{i1[:re]} #{i1[:im]} #{i2[:re]} #{i2[:im]}`.chomp if i == 0
        assert_equal result, `#{$binary_path} - #{i1[:re]} #{i1[:im]} #{i2[:re]} #{i2[:im]}`.chomp if i == 1
        # Put * and / in single quotes to avoid expansion in shell!
        assert_equal result, `#{$binary_path} '*' #{i1[:re]} #{i1[:im]} #{i2[:re]} #{i2[:im]}`.chomp if i == 2
        assert_equal result, `#{$binary_path} '/' #{i1[:re]} #{i1[:im]} #{i2[:re]} #{i2[:im]}`.chomp if i == 3
        i += 1
      end
    end
  end

  context "perform advanced operations" do
    i1 = { re: "-17", im: "-4i" }
    results = [ "0.48179310734638936-4.151159428194307i", "-17.0+4.0i", "-0.05573770491803279-0.013114754098360656i" ]
    j = 0

    should "return correct result" do
      results.each do |result|
        assert_equal result, `#{$binary_path} sqrt #{i1[:re]} #{i1[:im]}`.chomp if j == 0
        assert_equal result, `#{$binary_path} conj #{i1[:re]} #{i1[:im]}`.chomp if j == 1
        assert_equal result, `#{$binary_path} recp #{i1[:re]} #{i1[:im]}`.chomp if j == 2
        j += 1
      end
    end
  end

end
