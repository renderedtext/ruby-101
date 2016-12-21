#!/usr/bin/env ruby

require_relative "complex.rb"

case1 = ComplexNumber.new("-17", "-4i")
case2 = ComplexNumber.new("0", "2i")

puts "ComplexNumber class test suite"
puts
puts case1, case1.info
puts
puts case2, case2.info
puts
puts "(#{case1}) + (#{case2}) = #{case1 + case2}"
puts "(#{case1}) - (#{case2}) = #{case1 - case2}"
puts "(#{case1}) * (#{case2}) = #{case1 * case2}"
puts "(#{case1}) / (#{case2}) = #{case1 / case2}"
puts
puts "Done."
