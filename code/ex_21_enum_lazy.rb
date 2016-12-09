#!/usr/bin/env ruby

# Example of using lazy enumerators

# Extend the Integer class with method 'all' which implements
# a lazy enumerator that returns positive integers

def Integer.all
  # New Enumerator object, starting value is 0
  Enumerator.new do |yielder, n: 0|
    # Yields the code block associated with it,
    # with parameter being the value increased
    # With each yield, the value increases by 1
    loop { yielder.yield(n += 1)}
  end.lazy
end

print "First 7 positive integers: "
Integer.all.first(7).each { |i| print i, " " }

puts
print "First 7 positive integers divisible by 7: "
Integer
    .all
    .select { |i| (i % 7).zero? }
    .first(7)
    .each { |i| print i, " " }
