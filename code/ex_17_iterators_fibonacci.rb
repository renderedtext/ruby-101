#!/usr/bin/env ruby

# Example of using iterators to construct a Fibonacci sequence

# Method that yields a Fibonacci number from a sequence up to max limit
def fibonacci_upto(max)
  i1, i2 = 1, 1

  until i1 > max
    yield i1
  i1, i2 = i2, i1+i2
  end
end

# Print all Fibonacci numbers up to 1000
print "Fibonacci numbers: "
fibonacci_upto(100000) {|fib| print "#{fib}, " }
puts "\b\b."
