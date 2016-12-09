#!/usr/bin/env ruby

# Example of using Proc objects, using code blocks as objects,
# lambda, closures

# Define a class to store and call a block object
class ProcBlock
  def store_block(&block)
    @block = block
  end
  def use_block(parameter)
    @block.call(parameter)
  end
end


pinky = ProcBlock.new

# Store the code block after the method call
pinky.store_block do |param|
  puts "Code block called with parameter: #{param}"
end

# Call the stored code block and pass a parameter
pinky.use_block('testing')
pinky.use_block(42)
puts


# A method that returns the code block associated with is as an object
def create_block_obj(&block)
  block
end

blocky = create_block_obj do |param|
  puts "You called me with parameter: #{param}"
end

blocky.call 'doge'
blocky.call 777
puts


# Another way of creating block code objects is by using 'lambda'
cody = lambda { |n| puts "Hello to #{n}!" }

cody.call 'Rex'
cody.call 123
puts

# Alternative shorthand syntax: -> args {}
randy = -> name { puts "Hello, #{name}!" }

randy.call "Jack"
randy.call "Stella"
puts

# Using closures to generate powers of 2
def powerof2_generator
  # This variable will be accessed by the lambda block code
  # and its value will be preserved as long as the block code exists,
  # even though it is not inside the block code
  value = 1
  lambda { value += value }
end

powerof2 = powerof2_generator

print "Generating some powers of 2: "
10.times { print powerof2.call, " " }
puts


# Implement a while-loop using a method and passing it a block
def sugar_while(condition, &body)
  # Call the lambda code block, evaluate if true, then...
  while condition.call
    # If true, call the attached block code
    body.call
  end
end

numby = 1

print "Let's count to 10: "
sugar_while -> { numby <= 10 } do
  print numby, ", "
  numby += 1
end
puts "\b\b."
puts


# Passing parameters to blocks, old and new notation, and calling them

# The old way
block1 = lambda do |name, *things, &block|
  puts "Your name is #{name}."
  print "These things are yours: "
  things.each { |x| print x, ", "}
  puts "\b\b."
  block.call(name)
end

block1.call 'Hannah', 'sponge', 'shirt', 'raccoons' do |name|
  puts "#{name.capitalize} has all these things."
end

puts

# The new way
block2 = -> name, *things, &block do
  print "Hey, #{name}! This is yours: "
  things.each { |x| print x, ", "}
  puts "\b\b."
  block.call(name)
end

block2.call('Theodore', 'books', 'cheesecake') { puts "That's all!" }
