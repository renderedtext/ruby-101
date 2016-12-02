# Notes on programming using Ruby

Here I will describe my journey in learning the Ruby programming language.
The book I use is "Programming Ruby" (The Pragmatic Programmer's Guide).
This repository will be regularly updated with personal notes and code
from the examples, as well as my own programs.


## Ruby as an object oriented language

* Unlike other languages, everything in Ruby is an object, including
  return values of methods
* Class is a comnination of state (variables) and functions that use
  that state (methods)
* **Object = class instance**, created using a constructor method (.new)
* Every object has unique ID, state is held by instance variables,
  instance methods work on instance variables
* Methods are invoked by sending a message to the receiver object
  (method name, parameters); using parentheses() is a good idea, though
  they are optional, i.e. `puts "Hello"` is the same as `puts("Hello")`
* The value returned by a Ruby method is the value of the last
  expression evaluated, unless `return` is used!
* The `nil` object is an object that represents nothing


## Ruby syntax rules

* Names in lowercase:
  * local_variables, method_names, method_parameters
    * They can also start with an underscore `_`
    * Method names may end with `? ! =`
* Names in uppercase:
  * $global_variables, @local_variables, @@class_variables
  * Class_names, Module_names, Constants - Uppercase!


## String objects

* Strings are objects whose value is an array of characters; since they
  are objects, they have methods
* Stings surrounded with '' incur less processing than those with "",
  the latter tell Ruby to perform substitutions on escape sequences,
  so `puts '\n'` will print `\n` and `puts "\n"` will print a new line
* Expression interpolation: "#{name}" within a string is replaced with
  the value of the "name" expression, `puts "The time is #{Time.now}."`
  * Be careful, it does not work with strings within single quotes! ''


## Sting objects methods

* Method ".length" returns number of characters in a string array; works
  properly with Unicode characters, tested with Cyrillic letters
* Method ".index("char_or_string")" returns the position of the first
  occurence of the parameter (a character or a string)
  * Works on arrays, too
  * Counting of position starts from 0 for the first character, like C
* Method ".capitalize" returns the string with first letter in capital


## Number objects

* Numbers can be whole (integers, 27) and decimal (floating point, 3.14)


## Number object methods

* Methods ".odd?" and ".even?" return a boolean value (true/false),
  depending on whether the number object is odd or even


## Arrays and hashes

* Arrays and hashes are indexed collections of objects
* Arrays are more efficient to work with, and hashes provide flexibility
* They can be accessed using a key, where:
  * Arrays have integers as keys: `a = [3.14, 2, "lol"] ; a[0] #=>3.14`
    * Indices start at zero, so the first element is `a[0]`!
  * Hashes have any object as a key: `b = { 'cello' => 'string' }`
* Arrays can be defined using two notations:
  * `a = [3.14, 2, "lol"]`
  * `b = %w{ dog cat 27 342 673.99 just\ in\ case you\ noticed }`
    * Be careful with this: all of these values will be treated as
      strings, numbers included; spaces in strings must be escaped if
      you want them to be treated as one element of the array
    * Avoid using '' and "" quotes to surround the string or they
      will become part of it



Unless otherwise noted, all notes and code are copyright
©2016 Rendered Text and Filip Dimovski, released under the
GNU General Public License version 3 or greater. All rights reserved.
