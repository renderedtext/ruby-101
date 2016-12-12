#!/usr/bin/env ruby

# Example of using class inheritance

class Parent
  def initialize(name='Rex', thing='cookie')
    @name = name.capitalize
    @thing = thing.downcase
  end
  def give_thing
    puts "I give my #{@thing} to #{@name}."
  end
end

# This child class has Parent as its superclass, so it inherits
# all of its methods and global variables
class Child < Parent
  #~ def initialize(name, thing)
    #~ super name, thing
  #~ end
  def ownership
    puts "I have a #{@thing}."
  end
  def take(thing)
    @thing = thing
  end
end

p = Parent.new
p.give_thing      # Output: "I give my cookie to Rex."

c = Child.new('Max', 'cheesecake')
c.give_thing      # Output: "I give my cheesecake to Max."
c.ownership
c.take('chalk')
c.ownership       # Now Max will have chalk
p.give_thing      # Rex still has a cookie
