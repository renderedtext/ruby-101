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
* Methods whose name ends with a question mark ? `Time.sunday?` return
  `true` or `false`, so-called Boolean values 
* The `nil` object is an object that represents nothing
  * `nil` and `false` are treated the same in if-conditions
* Methods whose name ends with exclamation mark ! `String.downcase!`
  modify the state variable of the object they are invoked from and do
  not return the value, but `nil`, be careful!

## Ruby syntax rules

* Names in lowercase: local_variables, method_names, method_parameters
  * They can also start with an underscore `_`
  * Method names may end with `? ! =`
* Names in uppercase:
  * $global_variables, @local_variables, @@class_variables
    * After the sign(s), they can also start with an underscore `_`
  * Class_names, Module_names, Constants - Uppercase!
* Lines that start with an octothorpe # are comments
  * Comments can appear after code: `puts 'Hello!'  # Prints 'Hello!'`


## Using the Ruby interpreter

* Invoke it by issuing `irb` in your terminal emulator; you can test
  some code in it, but you cannot save it to a file
* Don't know what that class/method does? Try `ri method` for detailed
  explanations; if you do `ri class` it will show you all class methods
* Ruby programs should have `#!/usr/bin/env ruby` as a first line in
  every Ruby file that is part of the program
* The name of a Ruby program has the ending/extension `.rb`


## Some basic text input/output methods

* In UNIX-like systems (Linux), standard input (stdin) is the keyboard,
  standard output (stdout) is the console/terminal screen, and standard
  error output (stderr) is usually the same as the standard output; all
  of them can be redefined to read and write to a file, for example
* Method `puts` displays the result of an expression or a string on the
  standard output and adds a new line: `puts "Hello world!"`
  * If you want to stay on the same line, use `print` instead
* Method `gets` returns a string by reading from the standard input
  * Get the result in a variable to use it: `line = gets`


## String objects

* Strings are objects whose value is an array of characters; since they
  are objects, they have methods
* Stings surrounded with '' incur less processing than those with "",
  the latter tell Ruby to perform substitutions on escape sequences,
  so `puts '\n'` will print `\n` and `puts "\n"` will print a new line
* Expression interpolation: `"#{name}"` within a string is replaced with
  the value of the "name" expression, `puts "The time is #{Time.now}."`
  * Be careful, it does not work with strings within 'single quotes'!


## String objects methods

* Method `.length` returns number of characters in a string array; works
  properly with Unicode characters, tested with Cyrillic letters
* Method `.index("char_or_string")` returns the position of the first
  occurence of the parameter (a character or a string)
  * Works on arrays, too
  * Counting of position starts from 0 for the first character, like C
* Method `.capitalize` returns the string with first letter in capital


## Number objects

* Numbers can be whole (integers, 27) and decimal (floating point, 3.14)


## Number object methods

* Methods `.odd?` and `.even?` return a boolean value (true/false),
  depending on whether the number object is odd or even


## Arrays

* Arrays and hashes are indexed collections of objects
* Arrays are more efficient to work with, and hashes provide flexibility
* Arrays can be accessed using integers as keys:
  `a = [3.14, 2, "lol"] ; a[0] #=> 3.14`
  * Indices start at zero, so the first element is `a[0]`!
* Arrays can be defined using two notations:
  * `a = [3.14, 2, "lol"]`
  * `b = %w{ dog cat 27 342 673.99 just\ in\ case you\ noticed }`
    * Be careful with this: all of these values will be treated as
      strings, numbers included; spaces in strings must be escaped if
      you want them to be treated as part of an element of the array
    * Avoid using '' and "" quotes to surround the string or they
      will become part of it, or part of the first and last word
* If an index does not exist, when you access it it returns `nil`


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
  value when creating a hash: `instruments = Hash.new("none")`


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
* There is an alternative, shorthand syntax that does the same thing:
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

* A *regular expression* is a way of specifying a pattern of characters
  to be matched in a given string; it is put between slashes: `/regexp/`
* Match Perl or Python (the pipe | means 'or'): `/Perl|Python/`
  * Another way, using parentheses (): `P(erl|ython)`
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
  and return a new string as result
* Method `.gsub(/regexp/, 'text')` will replace all occurences of
  the matched 'text' from a given string and return a new string as result
* Lots of details about regular expressions can be found in the
  [Ruby's documentation](https://ruby-doc.org/core-2.3.1/Regexp.html)


Unless otherwise noted, the texts and code are copyright
© 2016 Rendered Text and Filip Dimovski, released under the
GNU General Public License version 3 or greater. All rights reserved.
