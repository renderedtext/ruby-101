# Ruby 101: Learning the Ruby Programming Language

Here I describe my journey in learning Ruby, a very cool and fast object
oriented interpreted programming language.
Having some basic knowledge of programming concepts is good for start.
This document is regularly updated, and I will provide lots of example
example code and programs, too. - Filip (a.k.a. rexich)

* Book used as a learning reference: "Programming Ruby (The Pragmatic
  Programmer's Guide)", by Dave Thomas, with Chad Fowler and Andy Hunt
* Ruby version: `ruby 2.3.1p112 (2016-04-26) [x86_64-linux-gnu]`
* Operating system: Ubuntu Linux 16.04.1 LTS, 64-bit


## Getting Ruby and necessary tools, some programming tips

* You can use your favorite UNIX-like operating system, Ubuntu Linux is
  used throughout this manual
* You should be comfortable with using the terminal, and a knowledge of
  Git basics is useful and recommended for maintaining your code
* In your favorite terminal emulator, install Ruby and its documentation
  utility, as well as Git (recommended):
```bash
$ sudo apt update && sudo apt install ruby ri git
```
* Use a good code editor that will perform syntax coloring on your code;
  my recommendations are [Geany](https://www.geany.org/), or
  [Vim](http://www.vim.org/):
```bash
# Install Geany:
$ sudo apt update && sudo apt install geany

# Or, install Vim:
$ sudo apt update && sudo apt install vim
```
* The Ruby interpreter is a great way to test code and see what it does,
  try it by entering `irb` in the terminal's command line
* Don't know what a class/method does? Try `ri method` in the terminal's
  command line to get detailed explanations
  * If you enter `ri Class` it will show you all class methods as well
* Ruby programs should have `#!/usr/bin/env ruby` as a first line in
  every Ruby file that is part of the program
* Since version 2, Ruby uses the Unicode (UTF-8) encoding when working
  with files; you can specify `#encoding: utf-8` as a second line if you
  intend to write programs for Ruby versions less than 1.9 (not
  recommended), otherwise it is unnecessary
* The name of a Ruby program has the ending/extension `.rb`
* Make sure the files are executable, `chmod +x my_program.rb` will do,
  so you can execute your program by typing `./my_program.rb`
* It is useful to separate chunks of code with common meaning into
  separate Ruby files, then use `require_relative 'my_ruby_file'` to
  import them into our code (from the same directory where our code is),
  to ensure *code reuse* and *modularity*
* To use Ruby-provided libraries, use `require`, e.g. `require 'csv'`
* Keeping everything in one file may be convenient at first, but:
  * it severely limits flexibility
  * it makes the code hard to debug, and difficult to reuse
  * Avoid it as much as possible and keep things in separate files


## Ruby as an Object Oriented language

* Unlike most other programming languages, *everything is an object* in
  Ruby, including the return values of methods
* *Variables* are references that point to objects in memory
* *Class* is a combination of state kept in memory and referred to using 
  *variables*, and *methods* - functions that use that state
* *Object* is an instance of a class, created by calling a constructor
  method called `#new`, e.g. `doge = Dog.new("Shiba Inu", "Toby")`,
  which in turn calls that class's method `.initialize`
* Object's state is held in *instance variables* `@variable`, and the
  *instance methods* work on the object's instance variables `#method`
* Variables defined outside classes are *global variables*, e.g.
  `$Variable`, and methods defined outside classes are *global methods*,
  e.g. `method(parameter)`
  * They are accessible by any method within or outside an object
* Methods are invoked (called) by sending a message to the receiver
  object, containing the method name, and zero or more *parameters*
  * Using parentheses `()` is a good idea, though they are optional, so
    `puts "Hello"` is the same as `puts("Hello")`
* Value returned by a method is the value of the last evaluated
  expression evaluated, unless `return` is used
* Method whose name ends with a question mark `?`, e.g. `Time.sunday?`,
  returns a Boolean value, `true` or `false`
  * They are very useful for if-conditions
* Object `nil` is an object that represents nothing; `nil` and `false`
  are treated the same in if-conditions
* Method whose name ends with an exclamation mark `!`, e.g.
  `String.downcase!`, modifies the state variables of the object and
  returns `nil`, be careful!


## Syntax rules

* Names in **lowercase**:
  * `local_variables`, `method_names`, `method_parameters`
  * `:symbols` (usually)
  * Method names may end with `? ! =`
* Names in **uppercase**:
  * `$Global_variables`, `@Local_variables`, `@@Class_variables`
  * `Class_names`, `Module_names`, `CONSTANTS`
* Variable names can start with an underscore `_`, e.g. `_rocket`, or
  `$_Candy`
* Lines that start with an octothorpe `#` are comments and are not
  executed, so you can use them to disable lines of code, or to write
  some text about what the code is doing
  * Comments can appear after code: `puts 'Hello!' # Prints 'Hello!'`
* When talking about methods, I'll prefix class method's name with a
  period `.`, e.g. `.method`, and prefix object method's name with an
  octothorpe `#`, e.g. `#method` - in real code though there are no
  such prefixes, but I'll use them here for our convenience


## Input/output (I/O) methods

* In Linux and UNIX-like operating systems, standard input `stdin` is
  the keyboard, standard output `stdout` is the console/terminal screen,
  and standard error output `stderr` is usually the same as the standard
  output and is used to provide error or diagnostic messages while a
  program is running (to keep them in a log file, for example)
  * They can be redirected to read or write from/to a file, for example
* Method `puts` displays the result of an expression, or a string on the
  standard output, and adds a new line: `puts "Hello world!"`
  * If you want the output to stay on the same line, use `print` instead
* Method `printf` outputs text under the control of *format strings*
  * Just like in C, format strings are pieces of text that get replaced
    with values under specific rules
  * First parameter of the method is the double-quoted string for
    output, containing the formatting strings, like `%5.2f`, substituted
    with a decimal number, minimum 5 digits before, and two after the
    decimal point; `%s` - substituted with a string, etc.
  * The rest of the method parameters are the values that will replace
    the formatting strings in the first parameter, e.g.:
```ruby
printf("Decimal number: %5.2f\nString: %s\n", 726.975, "doge")

# Outputs the following:
# Decimal number: 726.98  <= it got rounded, from .975 -> .98
# String: doge            <= :)
```
* [Ruby's documentation](https://ruby-doc.org/core-2.3.1/String.html)
  about String class has lots of information about formatting strings
* Method `gets` returns a string by reading text from the standard input
* Get the result in a variable to use it: `line = gets`


## Strings

* Strings are objects whose value is an array of Unicode characters
* You can create them in several ways:
  * By simply putting them between quotes: `'string'`, `"string"`
  * By using single-quoted `%q{}` and double-quoted `%Q{}` delimiters:
```ruby
# These are the same as 'Hello'
%q/Hello/
%q{Hello}
%q!Hello!

# These are the same as "Hello"
%Q/Hello/
%Q{Hello}
%Q!Hello!
```
  * As a *here document*:
```ruby
story = <<END_OF_STRING
  Everything between these two same words, the one after the '<<'
  and the one at the end, will be part of the string, without these
  two same words. You can use any word you like. By convention, they
  are written with capital letters, so you can notice them easily.
END_OF_STRING
```
* If we need to include a single quote `'` or a backslash `\` in a
  single-quoted string, we have to use *escape sequences* - a symbol
  prefixed with `\` that is used to enter characters that cannot be
  typed easily with a keyboard
* Double-quoted strings allow us to use more escape sequences and
  require more processing than single-quoted strings
  * Useful escape sequences: `\\` for a backslash `\`, `\n` for a new
    line, `\b` for a backspace, `\'` for a single quote `'`, `\"` for a
    double quote `"`
  so `puts '\n'` will print `\n` and `puts "\n"` will print a new line
* Double-quoted strings also have  *expression interpolation*:
  text inside `#{expression}` in these strings is evaluated and the
  return value of the `expression` is shown instead, e.g. `puts "The time is #{Time.now}."`
  * Be careful, it does *not* work in single-quoted strings!
* Adding one string to another will return a new *concatenated* string,
  do it by putting a plus sign `+` between them, e.g.:
```ruby
hello = "Hello " + "world!"
puts hello  # Prints "Hello world!"`
```
* Multiplying a string by a number `x` returns a new string with former
  string repeated `x` times, e.g.:
  `print "Hey! " * 5  # Prints "Hey! Hey! Hey! Hey! Hey! "`
* Strings can be compared by length (number of characters) using
  mathematical operators, such as `<` for lesser, `>` for greater, `==`
  for equal, `!=` for not equal; they return `true` or `false`
  * This is used a lot in if-conditions
* Another way of comparing strings, `"cats" <=> "crocodiles"`, returns:
  * -1 if the first one has less characters than the second one
  * 0 if they have the same length
  * 1 if the first one has more characters than the second one
* Method `.scan(/regexp/)` returns an array of substrings from the
  given string that match the regular expression, e.g.:
  `"It's your thing?".scan(/[\w']+/) # => ["It's", "your", "thing"]`
  * It returns an array with all the words in one sentence as elements
  * The regular expression matches one or more word characters one
    after another, not separated by spaces, and also words with single
    quotes, like `It's`


## String methods

* Methods `.length` or `.size` return number of characters in a string,
  e.g. `"doge".length  # => 4`, `"пас".size  # => 3`
* Method `.index("char_or_string")` returns the position of the first
  occurence of a character/string given as parameter
  * Works on arrays, as well - strings are arrays of characters
  * Counting of position starts from 0 for the first character
* Method `.capitalize` returns the string with first letter in capital
* Method `.upcase` returns the string with all letters in upper case
* Method `.downcase` returns the string with all letters in lower case
* Method `.dup` returns a duplicate of the string
* Method `.succ` called on one-character string returns a string with
  the next letter in alphabetic order
* Method `.chomp` will return a string without new lines at the end
  * There is a `.chomp!` method that will modify the string itself


## Numbers

* Numbers are objects whose values are - you guessed right, numbers :)
* Numbers can be whole (integers, 27) and decimal (floating point, 3.14)


## Number methods

* Methods `.odd?` and `.even?` return a boolean value (true/false),
  depending on whether the number is odd or even
* Method `.next` or `.succ` returns the next number (number+1)


## Arrays

* *Arrays* and *hashes* are indexed collections of object references
* Arrays are more efficient to work with, and hashes provide flexibility
* Each element in the array occupies a position in the array that is
  identified by a positive integer number or zero
* Arrays can be created like this:
  * By creating one from the `Array` class: `things = Array.new`
  * By simply providing zero or more elements between brackets `[]`,
    separated by commas `,`, e.g.
    `fruits = ['banana', 'orange', 'mango']`, `array = []`
  * By using the `%w{ }` delimiter, e.g. `b = %w{ dog cat 27 342 673.99
    just\ in\ case you\ noticed }`
  * Be careful with this one, spaces in strings must be escaped with
    a backslash `\` if you want them to be treated as one array element!
  * Avoid using '' and "" quotes to surround the string element, or they
    will become part of it, or part of the first and last word
* Array elements can be accessed (indexed) using integers as keys put
  between the brackets, after the array's name:
  `a = [3.14, 2, "lol"] ; a[0] #=> 3.14`
  * Indices start at zero, so the first element is `a[0]`
  * You can access elements backwards: `a[-1]` is last element of array,
    `a[-2]` is before-last one, and so on
  * You can also use the notation `array[start, count]`, where `start`
    is from which element to start, and `count` is the number of
    elements to return; it returns an array with the elements, e.g.:
```ruby
x = [2, 4, 6, 8, 10]

x[1, 2]   # => [4, 6]
x[2, 1]   # => [6]
x[-4, 3]  # => [4, 6, 8]
```
  * You can use ranges to access array values, by providing two or three
    periods between number values: `[1..4]` returns array with elements
    from second until (and including) fifth position, and `[1...4]`
    returns array with elements from second until (and excluding) fifth
    position (same as `[1..3]`), e.g.:
```ruby
x = [2, 4, 6, 8, 10]

x[1..4]   # => [4, 6, 8, 10]
x[1...4]  # => [4, 6, 8]
x[-4..-2] # => [4, 6, 8]
```
* If you try to access an element of the array that does not exist, the
  return value will be `nil`
* Assigning a value to an array is easy, use the `=` operator, e.g.:
  `x[0] = 42`
* To assign more than one value at once, you can use the notation
  `array[start, count] = [el1, el2, el3]`, where start is the starting
  location to add to, and count is the number of elements to be added;
  also, you can use ranges:
```ruby
x = [2, 4, 6, 8, 10]

# Replaces the 3rd element, does nothing to 4th because none is provided
x[2, 2] = "doge"    # => [2, 4, "doge", 10]
# Adds this as 3rd element, moves the rest forward, none is replaced
x[2, 0] = "cate"    # => [2, 4, "cate", "doge", 10]
# 5th element '10' replaced with '3', '6' and '9' appended
x[4, 1] = [3, 6, 9] # => [2, 4, "cate", "doge", 3, 6, 9]
# Removes 1st-4th elements
x[0..3] = []        # => [3, 6, 9]
# Adds two elements at positions 6 and 7, positions 3 and 4 are empty
# so their values are 'nil'
x[5..6] = [24, 48] # => [3, 6, 9, nil, nil, 24, 48]
```
* Method `.size` returns number of elements in array
* Method `.inspect` and `p array` prints all the elements of the array
* Arrays can be used as stacks, using method `.push element` to add
  element to end of array and method `.pop` to remove last element of
  stack and return it :
```ruby
stack = []

stack.push "book"   # => ["book"]
stack.push "pencil" # => ["book", "pencil"]
stack.push "eraser" # => ["book", "pencil", "eraser"]

stack.pop           # => "eraser"
stack.pop           # => "pencil"
stack.pop           # => "book"
stack               # => []
```
* To use an array as a FIFO (first-in first-on) queue, use `.shift` to
  remove and return the first element of array, and `.push element` to
  add element to the end of the array:
```ruby
queue = []

queue.push "dog"    # => ["dog"]
queue.push "cat"    # => ["dog", "cat"]
queue.push "mouse"  # => ["dog", "cat", "mouse"]

queue.shift         # => "dog"
queue.shift         # => "cat"
queue.shift         # => "mouse"
```
* Methods `.first(x)` and `.last(x)` return first or last `x` number of
  elements from an array, but they don't remove them


## Hashes

* Hashes (also called *dictionaries* or *associative arrays*) are
  collections where each element is accessed by using an object as a
  *key*, associated with a certain *value* (another object)
* Remember, keys are unique and **must not** repeat!
* Hashes can be created like this:
  * By creating one from the `Hash` class: `veggies = Hash.new`
  * Putting key-value associations joined by `=>`, each separated by
    commas `,`, between braces `{ }`:
```ruby
instruments = { 
  'guitar' => 'string',
  'trumpet' => 'brass',
  'drum' => 'percussion',
  'saxophone' => 'brass',
  'violin' => 'string'
}
```
  * Here, an object left of `=>` arrow is a key, and an object right of
    the arrow is its value, like in a dictionary or a phone book, e.g.:
  name => prone number, English word => Serbian word, and so on
* If the keys are *symbols* (see below), then besides the first way,
  there is a second way by using syntactic sugar (shorthand): put the
  colon in `:symbol` name last, omit the `=>` arrow and specify value:
```ruby
instruments = {
  guitar: 'string',
  trumpet: 'brass',
  drum: 'percussion',
  saxophone: 'brass',
  violin: 'string'
}
```
* Accessing (indexing) a value of a hash's element is similar to arrays,
  just provide the key between the brackets `[]`, e.g.:
  `instruments["guitar"] #=> string`
* If you try to access an element of the hash that does not exist, it
  returns `nil`; you can avoid this by assigning a default value when
  creating a hash: `instruments = Hash.new("default_value")`
* Method `.size` returns number of associations in hash
* Method `.inspect` and `p hash` prints all the associations of the hash


## Symbols

* Symbols are constant names that are guaranteed to be unique, so they
  don't need to be predeclared
* The name of a symbol starts with a colon : `:cookie`
* You don't have to assign it a value and Ruby makes sure the symbol
  has the same value no matter where you use it
* Frequently used with hashes, since keys must be unique


## Constants

* Constants are named values that never change throughout the program
* Their names are written in capital letters, e.g. `ANSWER = 42`
* They cannot be declared within methods, only in a class or globally
* You can access their values using the double colon `::` from outside
  a class, e.g. `Dogs::KIND # => "canine"`, or `::KIND = "feline"` if
  inside a module/method


## Control structures (if, for, while)

* Similar to most programming languages, Ruby provides the `if`, `for`,
  and `while`control structures
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


## Operators

* *Operator* is actually a method in form of symbol(s), which takes a
  value from the object on its right, and uses it as a parameter to call
  a method to the object on its left
* They are present in all programming languages and are similar to
  mathematical operators
* An expression will consist of objects with operators between thems
* *Arithmetical operators* include: addition `+`, subtraction `-`,
  multiplication `*`, division `/`, modulus (division remainder) `%`,
  exponent (on power of) `**`, simple assignment of values `=`
```ruby
# Parallel assignment: a = 10, b = 20
a, b = 10, 20

a + b    # => 30
a - b    # => -10
a * b    # => 200
a / b    # => 0
a % b    # => 10
a ** b   # => 100000000000000000000
```
* The `+` operator is also used to concatenate two or more strings
* Why did `a / b` return `0`? Because we were dividing two *integer*
  numbers, so the result is an integer, too; surround at least one
  number/variable with `Float()` to get `0.5`, the decimal answer
* *Comparison operators* include: equal values `==`,  not equal values
  `!=`, greater than `>`, less than `<`, greater or equal `>=`, less or
  equal `<=`, when-case equality `===`, same type and values `.eql?`,
  same object ID `.equal?`
  * Result is Boolean value `true` or `false`, useful in `if`-conditions
* Combined comparison `<=>`, e.g. `a <=> b`, returns -1 if `a < b`, 0 if
  `a = b`, and 1 if `a > b` - usually used for comparing strings
```ruby
a, b = 10, 20

a == b    # => false
a != b    # => true
a > b     # => false
a < b     # => true
a >= b    # => false
a <= b    # => true
```
* Besides the simple assignment operator, there are shorthand operators
  that perform the operation with values from the left and right side of
  the operator, and assign the result to the object on the left of the
  operator: add and assign `+=`, subtract and assign `-=`, multiply and
  assign `*=`, divide and assign `/=`, modulus and assign `%=`, exponent
  and assign `**=`, e.g. `a += 2` means `a = a + 2`
* *Bitwise operators* work on the binary bits of a value: AND `a & b`,
  OR `a | b`, XOR `a ^ b`, bit-flip unary complement `~a`, left shift
  `a << 2`, right shift `a >> 2`
* Refer to these [truth tables](https://en.wikipedia.org/wiki/Truth_table#Truth_table_for_all_binary_logical_operators) for details
* Logical operators are used in `if`-statements; return `true` or
  `false`:
  * `and`/`&&` - `true` if both operands are true/non-zero, `false`
    otherwise
  * `or`/`||` - `true` if one or both operands are true/non-zero,
    `false` otherwise
  * `not`/`!` - `true` if condition is false, `false` if condition is
    true - reverses the logical state of a given statement


## Blocks and iterators

* Code blocks are one or more lines of code between braces `{}` or
  between `do` and `end`, e.g.:
```ruby
# Braces are usually used for a single line of code
{ puts "Hello!" }

# A code block of many lines of code
do
  print "What's your name? "
  name = gets
  puts "Hello, #{name.capitalize}! Glad to meet you!"
end
```
* They are associated with method invocations, as if they are
  parameters, and must appear right after a method invocation and its
  parameters, e.g: `play_songs("We Are The Champions")
  { puts "Queen rule! :D" }`
* Usually used to implement callbacks, to pass around chunks of code, or
  especially to implement iterators
* If there is a variable defined outside the block, it can be accessed
  from within the block (like a global variable) using the same name
* This can be a source of bugs, to avoid it declare the block-local
  variable within the pipes `||` after a semicolon `;`, e.g.:
```ruby
# This variable will be accessed and modified from within the block
sum = 0
# However, this will not!
the_answer = 42

[1, 2, 3, 4, 5].each do |value; the_answer|
  sum += value ** 2
  the_answer += sum # Block-local variable
end

puts sum          # Prints "55"
puts the_answer   # Prints "42" - the variable did not change
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


## Command line arguments

* When we start a program from the command line, we can provide it with
  arguments (parameters) we can use in our Ruby program
* For example, you want to let the program have switches that can modify
  its behavior, so if it is an editor, if you give it a file name as an
  argument, it can open it for editing, otherwise it will create a new
  file and ask you to save it
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
  called when we call `.new()`, the *constructor* method
* `.initialize` is used to set up an environment for the object, so it
  can be in a usable state
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
* We can treat some instance methods like attributes, even though they
  do not have any instance variables with their name they work with the
  object's instance variables; we call the methods *virtual attributes*:
```ruby
class Fruit

  attr_accessor :kind, :price

  # Initialize the class
  def initialize(kind, price)
    @kind = kind
    @price = price
  end

  # Virtual attribute to get price in Euros
  def price_in_eur
    price / 122
  end

  # Virtual attribute to set price in Euros
  def price_in_eur=(price)
    @price = price * 122
  end

  # Tell us about the fruit when we do 'puts fruit'
  def to_s
    "Fruit kind: #{@kind}\nPrice in local currency per kg: #{@price} RSD"
  end
end

apple = Fruit.new('apple', 24)

# Show the price before the change
puts apple
puts "Price in EUR: #{apple.price_in_eur}"

# Show the price after the change
apple.price_in_eur = 7
puts apple
puts "Price in EUR: #{apple.price_in_eur}"
```
* Virtual attributes are useful if you isolate the implementation of
  your class from those who use it, by hiding the difference between
  instance variables and calculated values; this is good if you plan to
  refactor and change the way the class works, because it will not
  affect the code that uses your class


## Class method access control

* When designing a class interface, it's important to know how much of
  your class you'll expose to other code for use
  * Do not expose too much, otherwise external code will depend on your
    class's implementation instead of its interface, in which case any
    change to your class will break external code that depends on it
* Never expose methods that can leave an object in an invalid state
* Levels of protection Ruby provides for class methods:
  * *Public methods* can be called by anyone, no access control,
    default: `public`
  * *Protected methods* can be called only by object of the defining
    class and its subclasses, withing the family: `protected`
  * *Private methods* are only called within the context of the same
    object - methods of the same object can invoke these, but no other
    method outside the object can call them, including objects of the
    same class: `private`
  * Method `.initialize` is always private, that is why we instantiate
      an object by calling `.new`
```ruby
class SugarCube
  # Default access is public
  def method1
    # public method
  end

  # Methods from this one onwards will be 'protected',
  # until we change it to 'public' or 'private'
  protected
  def method2
    # protected method
  end

  def method3
    # again, protected method
  end

  # Methods from here onwards will be 'private'
  private
  def method4
    # private method
  end

  # Back to making methods 'public'
  public
  def method5
    # public method
  end
end
```


## Variables, aliasing, freezing objects

* *Variable* is a reference to an object kept in a memory pool called
  *heap*; each object has its own unique ID, which variables refer to
* There are three kinds of variables:
  * Global variables `$GlobalVar`, accessible from all classes and
    namespaces
  * Class variables `@@ClassVar`, accessible to methods of all objects
    that are instances of the same class
  * Local variables `@Localvar`, accessible to the methods of one
    object only
  * Block-local variables `var`, accessible only to the code block or
    within the method where they are declared (assigned with a value)
* If you assign a variable to an object, and then assign the variable
  to another variable, then both of them will refer to the same object,
  until one of them is assigned to another object
* Then, if you modify the object, it will reflect on both of variables
  when you try and access it - this is called *aliasing* and can be a
  major source of bugs, e.g.:
```ruby
dog = "Toby"
hound = dog     # Aliasing! Now they refer to the same object
dog[0] = "R"

puts dog        # Prints "Roby"
puts hound      # Prints "Roby", too!

hound = dog.dup # Duplicate the string to avoid aliasing
hound = "Pete"
dog[0] = "T"

puts dog        # Prints "Toby"
puts hound      # Prints "Pete"
```
* To avoid this, duplicate the string assigned: `hound = dog.dup`
* To prevent an object from being modified, use method `.freeze`, so any
  attempt to modify the frozen object will result in RuntimeError
  being raised


## Iterators

* *Iterator* is a method that invokes a block of code repeatedly
* Method `.each` returns value (from array) or key-value (from hash)
  to a block and executes this block repeatedly for each element, e.g.:
  `['apples', 'pears', 'mangoes'].each { |fruit| puts fruit }`
* To get the value(s) the iterator returns, grab them into variables by
  putting them after `do` of `{` of the block, between pipes `||`, like
  this: `hash.each { |key, value| puts key, value }`
* Methods `.map` and `.collect` do the same, are usually used with
  hashes, return an array of all resulting elements from the block
* When you have arrays, combine `.each` or `.map` with `.with_index` to
  get the index of iteration (not of array element!), e.g.:
```ruby
['apples', 'pears', 'mangoes'].map.with_index do |word, index|
  puts "#{word}, #{index}"
end

# Prints the following:
# apples, 0
# pears, 1
# mangoes, 2
```


Unless otherwise noted, the texts and code are copyright
© 2016 Rendered Text and Filip Dimovski, released under the
GNU General Public License version 3 or greater. All rights reserved.
