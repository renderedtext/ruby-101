#!/usr/bin/env ruby

# Example of working with methods

# Define simple method that returns a good night wish :)
def say_goodnight(name)
    result = "Good night, " + name + "."
    return result
end

puts say_goodnight("Michaella")
puts say_goodnight("Susan")


# Define another, slimmer method doing the same with less code
def say_goodnight2(name)
    "Good night, #{name}."
end

puts say_goodnight2("Rex")
