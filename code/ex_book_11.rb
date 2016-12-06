#!/usr/bin/env ruby

# An example of instantiating objects from a class

# Define the class and constructor
class Book

  # Method to instantiate an object
  def initialize(isbn, title, author)
    @isbn = isbn
    @title = title
    @author = author
  end

  # Method to return a string that represents the instance variables
  # in a pretty format, called by using '.to_s' or by using the object
  # as a string
  def to_s
    "ISBN: #{@isbn}; Title: #{@title}; Author: #{@author}."
  end

  # Accessor, returns ISBN number/code
  def isbn
    @isbn
  end

  # Accessor, returns title
  def title
    @title
  end

  # Accessor, returns author
  def author
    @author
  end

    # Accessor, sets ISBN number/code
  def isbn=(isbn)
    @isbn = isbn
  end

  # Accessor, sets title
  def title=(title)
    @title = title
  end

  # Accessor, returns author
  def author=(author)
    @author = author
  end

end


# Method to tell us details about a book in a pretty format
def pretty_print(book)
  # Use accessor methods to show the attributes
  header = "Cool Book's information"
  puts "#{header}"
  header.length.times { print '-'}
  puts
  puts "ISBN: #{book.isbn};"
  puts "Title: #{book.title};"
  puts "Author: #{book.author}."
end


# Instantiate some objects
cool_book = Book.new("8690215913",
                     "Da li postoje stvari koje ne postoje",
                     "Voja Antonić")
textbook = Book.new("none", "Mathematics", "me")


# Show us what they are made of
puts "Let's inspect the objects:"
p cool_book
p textbook

# Print their message when we try to use them as strings
puts
puts cool_book
puts textbook

# Pretty info about our book, before the change
puts
pretty_print(cool_book)

# Change book's info and show pretty info about it
cool_book.isbn = "42-9876-1234-05"
cool_book.author = "Битлси"
cool_book.title = "Нешто"
puts
pretty_print(cool_book)
