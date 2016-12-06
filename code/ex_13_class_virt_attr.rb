#!/usr/bin/env ruby

# Example of using virtual attributes in an object

class Fruit

  attr_accessor :kind, :price

  # Initialize the class
  def initialize(kind, price)
    @kind = kind
    @price = price
  end

  # Virtual attribute, get price in EUR
  def price_in_eur
    price / 122
  end

  # Virtual attribute, set price in EUR, conver to RSD
  def price_in_eur=(price)
    @price = price * 122
  end

  def to_s
    "Fruit kind: #{@kind}\nPrice in local currency per kg: #{@price} RSD"
  end
end


# Hold the fruits in an array
fruits_names = [ 'apples', 'pears', 'bananas', 'apricots', 'goyave']
fruits = Array.new(fruits_names.length)


# For each element in the list...
0.upto(fruits_names.length-1) do |x|
  
  # Instantiate objects automagically and keep them in array...
  fruits[x] = Fruit.new(fruits_names[x], 60 * x + 27)  # Price is w/e :)

  # Tell us about the new object...
  puts
  puts fruits[x]

  # And tell us its price in Euros
  puts "Price in Euros: #{fruits[x].price_in_eur} €"

end


# Let's give another price in EUR for a fruit of our choice
# and check how things changed for the fruit
y = 2 # We want the third fruit - be careful, it's an array, starts at 0
fruits[y].price_in_eur = 4

puts
puts fruits [y]
puts "Price in Euros: #{fruits[y].price_in_eur} €"
