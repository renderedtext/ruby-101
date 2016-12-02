#!/usr/bin/env ruby

# Define simple method that returns a good ngiht wish :)
def say_goodnight(name)
    result = "Good night, " + name
    return result
end

puts say_goodnight("John-boy")
puts say_goodnight("Mary-Ellen")


# Define another, slimmer method doing the same with less code
def say_goodnight2(name)
    "Good night, #{name}."
end

puts say_goodnight2("Rex")
