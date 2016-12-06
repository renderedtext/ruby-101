#!/usr/bin/env ruby

# Example of using class access control

# Define how a dog dogs :)
class Dogs

  # Give us a new dog 🐶
  def initialize(name, age, state);
    @name = name.capitalize
    @age = Integer(age)
    @state = state.downcase
  end

  # We cannot make it bark, it barks by itself :)
  # That is why this method is private
  private
  def bark
    puts "Woof, woof! 🐶"
  end

  # Petting and feeding the dog is something anyone can do
  # That's why these methods are public
  public
  def pet
    print  "#{@name} is happy! "
    @state = :happy
    bark
  end

  def feed(food)
    if @state == :hungry
      print "#{@name} ate some #{food}, now he's happy! "
      @state = :happy
      bark
    else
      puts "#{@name} is not hungry, he's doing fine. ✌"
    end
  end

  # Our dog's (very short) story
  def to_s
    "#{@name} is our dog, it's #{@age} years old. 🐶"
  end
end


# Let's get a dog
dog = Dogs.new("Toby", 3, :hungry)

# Let's see its story, then feed it, pet it, and feed it again
puts dog
dog.feed('bone')
dog.pet
dog.feed('fish')
