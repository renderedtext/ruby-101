#!/usr/bin/env ruby

require_relative "../lib/complex.rb"
#~ require_relative "../lib/operations.rb"

case1 = Rex::ComplexNumber.new("-17", "-4i")
case2 = Rex::ComplexNumber.new("0", "2i")

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
puts "sqrt(#{case1}) = #{case1.sqrt}"
puts "conjugate(#{case1}) = #{case1.conj}"
puts "reciprocal(#{case1}) = #{case1.recp}"
puts
puts "Done."
