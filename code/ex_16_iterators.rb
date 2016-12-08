#!/usr/bin/env ruby

# Example of using iterators

# A hash of tasty fruit, key: fruit name, value: number of fruits
fruits = {
  'mangoes' => 4,
  'apples'  => 7,
  'pears'   => 3,
  'quinces' => 9
}

sorted_list = fruits.sort_by { |fruit, amount| amount }

puts "List of fruits, sorted by amount:"
sorted_list.map { |fruit, amount| puts "#{fruit}, #{amount} pieces" }
