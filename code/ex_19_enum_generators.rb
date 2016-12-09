#!/usr/bin/env ruby

# Example of using enumerators as generators and filters

# 'yielder' is a new enumerator object
triangluar_numbers = Enumerator.new do |yielder|
  number = 0
  count = 1

  loop do
    number += count
    count += 1

    # Call the enumerator object and return the number
    # It gives a value back, and when we evaluate triangular_numbers
    # once again, execution continues after yield - the loop will repeat
    # again and yield another value
    yielder.yield number
  end
end

# Using an enumerator object as a generator of numbers
10.times { print triangluar_numbers.next, " " }
puts


# Extend the Enumerator class with a method, that returns values from
# the enumerator object only if the code block attached to this method
# evaluates to 'true'
class Enumerator
  def infinite_select(&block)
    # Create a new Enumerator object
    Enumerator.new do |yielder|
      # For each value the enumerator object returns,
      self.each do |value|
        # Call the code block passed as a parameter,
        # return a value if it evaluates to 'true'
        yielder.yield(value) if block.call(value)
      end
    end
  end
end

# Return first 5 triangular numbers that can be divided by 10,
# and that contain the digit 7
p triangluar_numbers
                    .infinite_select { |val| val % 10 == 0 }
                    .infinite_select { |val| val.to_s =~ /7/}
                    .first(5)
