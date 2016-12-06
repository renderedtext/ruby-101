# Notes on programming using Ruby

Here I will describe my journey in learning the Ruby programming language.
The book I use is "Programming Ruby" (The Pragmatic Programmer's Guide).
This repository is regularly updated with personal notes and some
example code and programs as well.


## Ruby as an object oriented language

* Unlike other languages, everything in Ruby is an object, including
  return values of methods
* Class is a combination of state (variables) and functions that use
  that state (methods)
* **Object = class instance**, created using a constructor method (.new)
* Every object has unique ID, state is held by instance variables,
  instance methods work on instance variables
* Methods are invoked by sending a message to the receiver object
  (method name, parameters); using parentheses() is a good idea, though
  they are optional, i.e. `puts "Hello"` is the same as `puts("Hello")`
* The value returned by a Ruby method is the value of the last
  expression evaluated, unless `return` is used!
* Methods whose name ends with a question mark `?` `Time.sunday?` return
  `true` or `false`, so-called Boolean values 
* The `nil` object is an object that represents nothing
  * `nil` and `false` are treated the same in if-conditions
* Methods whose name ends with exclamation mark `!` `String.downcase!`
  modify the state variable of the object they are invoked from and do
  not return the value, but `nil`, so be careful!


## Ruby syntax rules

* Names in **lowercase**:
  * local_variables, method_names, method_parameters
  * They can also start with an underscore `_`
  * Method names may end with `? ! =`
* Names in **uppercase**:
  * $global_variables, @local_variables, @@class_variables
    * After the sign(s), they can also start with an underscore `_`
  * Class_names, Module_names, Constants - Uppercase!
* Lines that start with an octothorpe # are comments
  * Comments can appear after code: `puts 'Hello!'  # Prints 'Hello!'`


## Using the Ruby interpreter

* Invoked by issuing `irb` in your terminal emulator; you can test some
  code in it, but you cannot save it to a file
* Don't know what that class/method does? Try `ri method` for detailed
  explanations; if you do `ri class` it will show you all class methods
* Ruby programs should have `#!/usr/bin/env ruby` as a first line in
  every Ruby file that is part of the program
* The name of a Ruby program has the ending/extension `.rb`


## Input/output (I/O) methods

* In UNIX-like systems and Linux, standard input (stdin) is the keyboard,
  standard output (stdout) is the console/terminal screen, and standard
  error output (stderr) is usually the same as the standard output; all
  of them can be redefined to read and write to a file, for example
* Method `puts` displays the result of an expression or a string on the
  standard output and adds a new line: `puts "Hello world!"`
  * If you want to stay on the same line, use `print` instead
* Method `printf` outputs text under the control of *format strings*,
  like in C, which get replaced with values under specific rules
  * First parameter is the string for output, containing the
  formatting strings, like `%5.2f` - substituted with a decimal number,
  minimum 5 digits before, and two after the decimal point; `%s` -
  substituted with a string, etc.
  * The rest of the method parameters are the values that will replace
    the formatting strings in the first parameter
```ruby
printf("Decimal number: %5.2f\nString: %s\n", 726.975, "doge")

# Outputs the following:
# Decimal number: 726.98  <= it got rounded, from .975 -> .98
# String: doge            <= :)
```
* [Ruby's documentation](https://ruby-doc.org/core-2.2.0/String.html)
  about String objects covers all about formattings strings as well
* Method `gets` returns a string by reading from the standard input
  * Get the result in a variable to use it: `line = gets`


## String objects

* Strings are objects whose value is an array of characters; since they
  are objects, they have methods
* Stings surrounded with '' incur less processing than those with "",
  the latter tell Ruby to perform substitutions on escape sequences,
  so `puts '\n'` will print `\n` and `puts "\n"` will print a new line
* *Expression interpolation*: `"#{name}"` in a string is replaced with
  the value of the `name` expression: `puts "The time is #{Time.now}."`
  * Be careful, it does not work in strings with 'single quotes'!
* Concatenating strings (adding one to another) using plus sign `+`:
  `hello = "Hello " + "world!"  # 'puts hello' gives 'Hello world!'"`
* Multiplying a string with a number X returns new string with given
  string repeated X times:
  `print "Hey! " * 5  # Prints "Hey! " five times in the same line`
* Comparing strings: `puts "cats" <=> "crocodiles"`'
  * Returns -1 if the first one has less characters than the second one,
  0 if they have the same length, or 1 if the first one has more
  characters than the second one
* Also, comparing strings using `==` or `!=` in `if` conditions is
  possible, too:
```ruby
dog = "Toby"

puts "It's Toby." if dog == "Toby"
puts "It's not Munchkin." if dog != "Munchkin"
```


## String objects' methods

* Method `.length` returns number of characters in a string array; works
  properly with Unicode characters (tested with Cyrillic letters)
* Method `.index("char_or_string")` returns the position of the first
  occurence of the parameter (a character or a string)
  * Works on arrays, too
  * Counting of position starts from 0 for the first character, like C
* Method `.capitalize` returns the string with first letter in capital


## Number objects

* Numbers are objects whose values are - you guessed right, numbers :)
* Numbers can be whole (integers, 27) and decimal (floating point, 3.14)


## Number objects' methods

* Methods `.odd?` and `.even?` return a boolean value (true/false),
  depending on whether the number object is odd or even


## Arrays

* Arrays and hashes are indexed collections of objects
* Arrays are more efficient to work with, and hashes provide flexibility
* Arrays can be accessed using integers as keys:
  `a = [3.14, 2, "lol"] ; a[0] #=> 3.14`
  * Indices start at zero, so the first element is `a[0]`, like in C
* Arrays can be defined using two notations:
  * `a = [3.14, 2, "lol"]`
  * `b = %w{ dog cat 27 342 673.99 just\ in\ case you\ noticed }`
    * Be careful with this: all of these values will be treated as
      strings, numbers included; spaces in strings must be escaped if
      you want them to be treated as part of an element of the array!
    * Avoid using '' and "" quotes to surround the string or they
      will become part of it, or part of the first and last word
* If an index does not exist, when you access it, it returns `nil`
* Method `.size` returns number of elements in array
* Method `.inspect` and `p` let you see all the elements of the array


## Hashes

* Hashes can be accessed by using an object as an key, unlike arrays
* Defining a hash:
```ruby
instruments = {
  'guitar' => 'string',
  'trumpet' => 'brass',
  'drum' => 'percussion',
  'saxophone' => 'brass',
  'violin' => 'string'
}
```
* Here, the thing to the left of the `=>` arrow is the key, and the
  thing to the right is its value, like in a dictionary or a phone book:
  name => prone number, English word => Serbian word, etc.
* The keys are unique and must not repeat!
* Accessing a value of a hash's element (indexing it) is the same as in
  arrays: `instruments["guitar"] #=> string`
* If you index a hash with a key that does not match any of the given
  ones, it returns `nil`; you can avoid this by assigning a default
  value when creating a hash: `instruments = Hash.new("default_value")`


## Symbols

* Symbols are constant names (enums in C) that are guaranteed to be
  unique and they don't need to be predeclared
* The name of a symbol starts with a colon : `:cookie`
* You don't have to assign it a value and Ruby makes sure the symbol
  has the same value no matter where you use it
* Frequently used with hashes, since keys must be unique:
```ruby
instruments = {
  :guitar => 'string',
  :trumpet => 'brass',
  :drum => 'percussion',
  :saxophone => 'brass',
  :violin => 'string'
}
```
* There is a shorthand, a syntactic sugar that does the same thing:
```ruby
instruments = {
  guitar: 'string',
  trumpet: 'brass',
  drum: 'percussion',
  saxophone: 'brass',
  violin: 'string'
}
```


## Control structures

* Similar to most programming languages, Ruby provides the `if`, `while`
  and `do` control structures
* All of the control structures must be terminated with `end`
* The `if` control structure executes code if the given condition
  evaluates to `true`, `elsif` gives another condition if the previous
  is false, and `else` executes if the conditions of `if` and `elsif`
  are not fulfilled:
```ruby
today = Time.now

if today.saturday?
  puts "Let me remind you, you should clean around the house."
elsif today.sunday?
  puts "It is time to relax. Get some good rest."
else
  puts "Get ready for work."
end
```
* There is an alternative form of `if`, called *statement modifier*,
  used for a single expression:
```ruby
# The alternative form:
puts "Party time! =]" if Time.now.friday?

# In other words, same as:
if Time.now.friday?
  puts "Party time! =]"
end

```
* The `while` control structure executes a block of commands as long as
  the given condition is true:
```ruby
counter = 2

print "The even numbers from 2 to 10 are: "

while counter <= 10
  print "#{counter}, "
  counter += 2  # It means just like in C: counter = counter + 2
end

puts "\b\b."  # Two backspaces, and a dot, to finish the sentence.
```
* Just like `if`, you can use a *statement modifier* for a single
  expression with `while`:
```ruby
# The alternative form:
square = 10
square = square ** 2 while square < 1000

# The typical form:
square = 1000
while square < 1000
  square = square ** 2
end
```


## Regular expressions

* A *regular expression* (regexp) is a way of specifying a pattern of
  characters   to be matched in a given string; it is put between
  slashes: `/regexp/`
* Match Perl or Python (the pipe | means 'or'): `/Perl|Python/`
  * Another way, using parentheses (): `/P(erl|ython)/`
* We can also specify *repetition* in patterns:
  * `/ab+c/` - match string with `a`, followed by one or more `b`,
    followed by `c`
  * `/ab*c/` - match string with `a`, followed by zero or more `b`,
    followed by `c`
* We can specify *character classes* to match a group of characters:
  * `\s` - match whitespace (space, tab, new line)
  * `\d` - match any digit (0-9)
  * `\w` - match anything which can be a part of a word (letters,
    numbers, and an underscore `_`)
  * `.` - match any character except a new line
* A `^` before an expression means don't match: `/^\d\d/` will not match
  any two digits one after another
* Putting brackets `[]` and a dash `-` between modifiers creates ranges:
  `/[a-z0-9]/` means match one lowercase letter or a digit
* To match a string against a regular expression, use `=~`, it returns
  a string from the first occurence of the expression:
```ruby
line = gets.downcase

if line =~ /ruby/
  puts "It's Ruby! =]"
else
  puts "It's something else: #{line}."
end

```
* Method `.sub(/regexp/, 'text')` will replace the first occurence of
  the matched 'text' according to the regexp pattern from a given string
  and return a new string result
* Method `.gsub(/regexp/, 'text')` will replace all occurences of
  the matched 'text' from a given string and return a new string result
* Lots of details about regular expressions can be found in the
  [Ruby's documentation](https://ruby-doc.org/core-2.3.1/Regexp.html)


## Blocks and iterators

* Code blocks are one or more lines of code between braces `{}` or
  between `do` and `end`
```ruby
{ puts "Hello!" }  # Braces are usually used for a single line of code

# A code block of many lines of code
do
  print "What's your name? "
  name = gets
  puts "Hello, #{name.capitalize}! Glad to meet you!"
end
```
* They can be associated with method invocations, as if they are
  parameters; usually used to implement callbacks, to pass around
  chunks of code, or to implement iterators
* They are attached after a defined method's call, after the given
  parameters, if any:
```ruby
play_songs("We Are The Champions") {puts "Queen rule! :D"}
```
* Invoke the code block using `yield` within the method's code
* You can provide arguments to the code block by adding them between
  two pipe characters `|` after the opening brace:
  `{ |param1, param2| puts param1 + param2 }`
* Example of calling a method, providing the code block and calling it
  from within the method:
```ruby
def say_something
  puts "Executing the method. Will yield next."
  yield("Pete", "Hello!")
  yield("Sally", "Woot!")
  puts "Finished yielding."
end

say_something { |person, text| puts "#{person} says '#{text}'." }

```
* Code blocks are frequently used as iterators, methods that return
  successive elements of some kind of collection, using `each` method:
```ruby
animals = [ "dog", "cat", "mouse", "duck", "lizzard" ]
animals.each {|animal| print animal, ', '}  # Interation over an array
puts "\b\b."
```
* There are methods such as `Number.times` and `Number.upto(Num)` to
  loop several given times, or until a certain number, incrementing it
  on each turn:
```ruby
20.times { print '* ' }  # Prints 20 stars :)
puts

print "Let's count to 10: "
1.upto(10) { |num| print num, ', ' }
puts "\b\b."
```
* Provide a character/number range `(a..z).each` to iterate over it:
  * `(0..10).each` returns the numbers from 0 to 10, but `(0...10).each`
    returns numbers from 0 to 9, 10 excluded - be careful!
```ruby
(1..20).each { |digit| print digit, " " }  # Prints numbers from 1 to 20
puts
```


## Command Line arguments

* When we start a program from the command line, we can provide it with
  arguments (parameters) we can use in our Ruby program
* For example, you want to let the program have switches that can modify
  its behavior, so if it is an editor, if you give it a file name as an
  argument, it can open it for editing, otherwise it will create a new
  file and asko you to save it
```sh
rex@ultrabok ~ $ ./my_program.rb doge 42 "cabbage rolls"
```
* We can use the `ARGV` array to get all the provided command line
  arguments and use them in our program
* `ARGV.size` returns the total number of arguments
* Start the program from the command line, give it some arguments, and
  it will print out the number of arguments and an array of them:
```ruby
puts "You provided #{ARGV.size} arguments from the command line."
print "Those are: "
p ARGV  # It means: 'ARGV.inspect ; puts'
```


## Classes and instantiation

* Whenever we design systems using object oriented programming, it is
  a good practice to identify the things we need; they typically become
  classes, and the things themselves become instances of these classes
* Class is defined with the keyword `class`, the name of the class, and
  terminated with `end`
```ruby
class Book
end
```
* An object is an instance of a class, it is created by calling the
  `new` method of the class: `textbook = Book.new`
* We can define some default values when we create an object from a
  class, by defining an `.initialize(vars_values)` method which gets
  called when we call `.new()`, the *constructor* method:
```ruby
# Define a class
class Book
  def initialize(isbn, title, author)
    @isbn = isbn
    @title = title
    @author = author
  end
  def to_s
    "ISBN: #{@isbn}; Title: #{@title}; Author: #{@author}."
  end
end

# Instantiate an object
cool_book = Book.new("8690215913",
                     "Da li postoje stvari koje ne postoje",
                     "Voja Antonić")

# Inspect what the object contains
# It should print something like: #<Book:0x00000000b3c9a0
# @isbn="8690215913", @title="Da li postoje stvari koje ne postoje",
# @author="Voja Antonić">
# The hexadecimal number is the memory address of the object
p cool_book
```
* Remember, `@var` is an instance variable, and they are part of the
  object; **only the object's methods can access instance variables!**
  * That means, in the example, `@isbn` is an instance variable, and
    it is NOT the same as `isbn`, whose value is passed to `@isbn`
* Whenever you use the object's return value with a method that expects
  a string, Ruby will call the `.to_s` method of the object, so we
  can override it and return our own message
    * Remember, the last result is returned, unless we use `return`
* If we want to get the values of instance variables, we need to define
  some *accessors*; the instance variables that are accessible to other
  objects through the accessor methods are called *attributes*
* Setting an object's attribute can be done by writing a method whose
  name ends with an equals sign `=`, and with a variable in parentheses:
```ruby
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
```
* Since this requires lots of repetition, for our convenience Ruby
  provides shorthands that use symbols for instance variables' names:
  * `attr_reader` for read-only access:
    `attr_reader :isbn, :title, :author`
  * `attr_writer` for write-only access, used very rarely
  * `attr_accessor` for read/write access - very commonly used
    
```ruby
# Define the class, accessors and constructor
class Book

  # Attribute accessor
  attr_accessor :isbn, :title, :author

  # Method to instantiate an object
  def initialize(isbn, title, author)
    @isbn = isbn
    @title = title
    @author = author
  end

end

# 
book = Book.new("none", "Textbook", "me")
puts "ISBN: #{book.isbn}"
puts "Title: #{book.title}"
puts "Author: #{book.author}"

book.isbn = "42-9876-1234-05"
book.author = "Битлси"
book.title = "Нешто"

puts "ISBN: #{book.isbn}"
puts "Title: #{book.title}"
puts "Author: #{book.author}"

```



Unless otherwise noted, the texts and code are copyright
© 2016 Rendered Text and Filip Dimovski, released under the
GNU General Public License version 3 or greater. All rights reserved.
