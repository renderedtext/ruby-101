#!/usr/bin/env ruby

require_relative "complex.rb"

test1 = ComplexNumber.new("-1", "0")
test2 = ComplexNumber.new("0", "2i")
test3 = ComplexNumber.new("-17", "-4i")
test4 = ComplexNumber.new("-0", "-0i")

[test1, test2, test3, test4].each do |num|
  puts "Complex number: #{num}"
  puts num.info
  puts
end

puts "#{test1} * #{test3} = #{test1 * test3}"
puts "#{test1} + #{test3} = #{test1.add!(test3)}"
puts test1.info


case1 = ComplexNumber.new("-17", "-4i")
case2 = ComplexNumber.new("0", "2i")
result1 = case1 + case2
puts
puts case1
puts case2
puts
puts result1
