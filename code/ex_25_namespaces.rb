#!/usr/bin/env ruby

# Example of using namespaces and mixins

module Cookie
  NUM_COOKIES = 5
  def Cookie.give(cookie)
    puts "I give you this tasty #{cookie.downcase}."
  end
end

module Book
  def Book.give(book)
    puts "I give you this lovely book, '#{book}.'"
    puts "Enjoy reading it! :)"
  end
end

Cookie.give 'baklava'
puts "Currently there are #{Cookie::NUM_COOKIES}. Enjoy!"
puts
Book.give 'The Little Prince'


# Mixins
module About
  def tell_about
    puts "This is #{self.name}, a #{self.kind}, " +
         "and it's #{self.age} years old."
    self.make_noise     # Call the object's instance method
  end
end

class Cats
  include About
  attr_reader :name, :kind, :age
  def initialize(name='Toby', kind='Cheshire', age=3)
    @name, @kind, @age = name, kind, age
  end
  def make_noise
    puts "Meow!"
  end
end

class Dogs
  include About
  attr_reader :name, :kind, :age
  def initialize(name='Rex', kind='German Shepherd', age=7)
    @name, @kind, @age = name, kind, age
  end
  def make_noise
    puts "Woof!"
  end
end

cat = Cats.new('Lynx', 'Siamese', 2)
dog = Dogs.new

cat.tell_about
dog.tell_about
