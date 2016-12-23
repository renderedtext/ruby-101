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
  my recommendations are [Geany](https://www.geany.org/) or
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
  * In case you use Ruby 1.9 or earlier, use this instead:
```ruby
$: << File.dirname(__FILE__)
require 'other_file'
```
* To use Ruby-provided libraries, use `require`, e.g. `require 'csv'`
* Keeping everything in one file may be convenient at first, but:
  * it severely limits flexibility
  * it makes the code hard to debug, and difficult to reuse
* Write each statement in a separate line; if you write two or more on
  the same line, separate them with a semicolon `;`


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


## Methods

* *Methods* are same as functions in other programming languages, they
  are a collection of one or more stetements/expressions that are given
  a name, so we can call them more than once throughout the code
* Methods are defined using the keyword `def`, a name, and optionally
  one or more variable names between parentheses `()` - *parameters*,
  statements in separate lines, and the definition terminates with `end`
* Parameters are local variables who will get their values once we call
  the method and provide expressions between parentheses who will be
  evaluated before the method call
  * You can also provide default values for the parameters with equal
    sign `=` in the method's definition, e.g.:
```ruby
def hello(name='Rex')
  puts "Hello #{name.capitalize}!"
end
```
* Methods are invoked (called) by sending a message to the receiver
  object, containing the method name, and zero or more parameters
  * Using parentheses `()` is a good idea, though they are optional, so
    `puts "Hello"` is the same as `puts("Hello")`
  * You can provide default values for parameters in a method definition
    which are used in case none is provided, e.g.:
```ruby
def hello(name='Rex')   # 'Rex' is the default value
  puts "Hello, #{name}!"
end

hello           # Prints: "Hello, Rex!"
hello('Alex')   # Prints: "Hello, Alex!"
```
* When you call a method, you have to provide the exact number of
  necessary parameters, otherwise error will occur
* If you want to provide zero or more parameters, and you do not know
  their exact number, you can use an asterisk `*` before an argument's
  name and then use `for` to get each value from that array, e.g.:
```ruby
def say_hello(*names)
  # 'names' will be an array holding zero or more parameters

  # Complain about no names given
  if names.length == 0
    puts "Give me a name first!"
    return
  end

  print "Hello to "
  for i in 0...names.length   # Last array element = length - 1
    print "#{names[i]}, "
  end
  puts "\b\b."
end

# Prints: "Give me a name first!"
say_hello
# Prints: "Hello to Rex."
say_hello('Rex')
# Prints: "Hello to Rex, Alex, Martha, Samanta."
say_hello('Rex', 'Alex', 'Martha', 'Samanta')

```
* Value returned by a method is the value of the last evaluated
  expression evaluated, unless `return` is used to return a value, or
  more values from expressions separated by commas as an array, e.g.
  `return 'lol', 42, Array.new`
  * Use parallel assignment to collect the results from the return
    values, e.g. `name, age = person.query`
* Method whose name ends with a question mark `?`, e.g. `Time.sunday?`,
  returns a Boolean value, `true` or `false`
  * They are very useful for providing conditions to `if` and loops
* Object `nil` is an object that represents nothing; `nil` and `false`
  are treated the same in if-conditions
* Method whose name ends with an exclamation mark `!`, e.g.
  `String.downcase!`, modifies the state variables of the object and
  returns `nil`, be careful!
* `alias_method` assigns another name for a method, e.g.
  `alias_method :new, :old`, so when you call `new` it'll refer to `old`
* `undef` cancels a method's definition, e.g. `undef new`; these can be
  used only outside a method's code block
* You can also use a hash to provide parameters to a method, and use
  double asterisk `**` for the last argument to collect any extra ones:
```ruby
def search(field, genre: nil, duration: 120, **rest)
  p [field, genre, duration, rest]
end
```
* You can define a method call that has square brackets `[]`, and
  assignment with equal sign `=`:
```ruby
class Example
  def [](e1, e2, e3)
    puts e1 + e2 + e3
  end
  def []=(*params)
    value = params.pop
    puts "Index: #{params.join)', ')};"
    puts "Value: #{value.inspect}."
  end
end
```
* You can execute an operating system (shell) command and get its
  output and assign it to a variable; surround the shell command with
  backticks ` , e.g.:
```ruby
puts `date`.chomp!
```

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
story = <<-END_OF_STRING
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
  return value of the `expression` is shown instead, e.g.
  `puts "The time is #{Time.now}."`
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
* Method `.encoding` returns the character encoding of the string,
  by default that is UTF-8
* Method `.split(regexp)` will return string(s) from the string that
  calls it, that match the regular expression provided as a parameter
* Method `.squeeze(chars)` will find the repetitions of the character(s)
  given as parameter in the calling string and replace them with the
  string(s) in the parameter (e.g. to squeeze out extra spaces into one)
  and return the resulting string
  * Calling the method `squeeze(chars)!` will modify the calling string
    instead of returning a new one
* Method `.to_i` will return an integer, and is used to convert a string
  representation of an integer number to an usable integer
* Method `.each(separator=" ") { |x| ... }` will return words from the
  string (separated with the optional separator parameter) and give
  them to the attached block code as it executes for each iteration
  * If you use `.each_line`, it will return lines
* Method `.empty?` returns `true` if string has no characters
* Method `.each_byte { |x| ... }` returns bytes (not characters, but
  octets) from the string and gives them, one by one, to the attached
  block code for each iteration
* Method `.include? "string"` returns `true` if the given string is
  found inside the calling string object
* Method `.reverse` will return string with all characters in reverse
  * Call the method with `!` to apply it to the calling string object
* Methods `.lstrip` and `.rstrip` remove leading or trailing whitespace
  from the return string and return the resulting string
  * Method `.strip` will perform both
  * Call the methods with `!` to apply them to the calling string object
* Method `.swapcase` returns a string with upper case characters in
  lower case, and lower case characters in upper case


## Numbers

* *Numbers* are objects who return several types of numbers
* Ruby supports integers (whole numbers), floating-point (decimal),
  rational and complex numbers
* Integers within the range of the CPU's bitness (32 or 64 bit) are
  stored as their binary representations to allow fast processing and
  avoid storage overhead, and they are of class Fixnum
* Integers beyond these ranges are stored as variable-lenght sets of
  shorter integers, the objects being of class Bignum, and their lenght
  is limited to the amount of available memoryof the system
* Ruby will do the conversion between Fixnum and Bignum as needed
* You can separate groups of digits for avoiding ambiguity while reading
  using underscore `_`, Ruby will ignore them
* Writing integers in different notations:
```
The integer 2468 in several notations:
Binary        (base 2)      0b100110100100
Octal:        (base 8)      04644
Decimal:      (base 10)     0d2468
Hexadecimal:  (base 16)     0x9a4
```
* Displaying numbers in different notations can be easily achieved by
  using the `printf` kernel method, e.g.:
```ruby
num = 2468
# Print the number in several notations
print "\nThe integer #{num} in several notations:\n"
printf("Binary        (base 2)      0b%b\n", num)
printf("Octal:        (base 8)      0%o\n", num)
printf("Decimal:      (base 10)     0d%d\n", num)
printf("Hexadecimal:  (base 16)     0x%x\n", num)

# Output:
# The integer 2468 in several notations:
# Binary        (base 2)      0b100110100100
# Octal:        (base 8)      04644
# Decimal:      (base 10)     0d2468
# Hexadecimal:  (base 16)     0x9a4
```
* Numbers with a decimal point are stored in objects of class Float,
  whose value and precision are the same as the computer architecture's
  double data type
* Be careful, if you use the E-notation, you must write at least one
  digit (if none, a zero) between the dot `.` and `e`, e.g. `24.0e2` is
  okay, but `24.e2` is not, otherwise Ruby will suppose you're calling
  a method named `e2`
* To represent rational numbers, like 2/3, use `Rational(2, 3)`, where
  first parameter is numerator, second is denominator and cannot be zero
  (because we cannot divide by zero)
  * Another syntax is by providing a string: `Rational('2/3')`
  * You can make rationals from floating-points: `Rational('0.3')`
* If you add a string to an integer, it will not work, so put the string
  inside `Integer()` to convert it to a number and perform addition;
  you can do the same to convert some string to a floating-point, or
  any number to string
* Complex numbers can be expressed similar to the rational ones, e.g.
  `Complex(1, 2)`, where first parameter is the real part, second is the
  imaginary part of the number
  * You can also use a string instead: `Complex('1+2i')`


## Number methods

* Methods `.odd?` and `.even?` return a boolean value (true/false),
  depending on whether the number is odd or even
* Method `.next` or `.succ` returns the next number (number + 1)
* Methods `.upto(x)` and `.downto(x)` will use the value of the number
  object they are called from, increment it or decrement it by one,
  and execute an attached block code in a loop until the value becomes
  as given in the parameter, e.g.:
```ruby
1.upto(5) { |i| print i, ", " } ; puts "\b\b."
# Output: 1, 2, 3, 4, 5.
```
* Method `.step(to, step)` will start counting from the number object
  it is called from, add `step` to it, and execute the block code in a
  loop until it gets to the `to` value, just like in a common for-loop:
```ruby
11.step(99,11) { |i| print i, " " }
# Output: 11 22 33 44 55 66 77 88 99
```


## Ranges

* *Ranges* are used to express a sequence of numbers, characters, or
  words (the last letter will change to the succeeding one)
* We can create sequences by providing two `..` or three `...` periods
  and putting the starting and the ending limits of the range
  * Using `..` will include the ending limit, `...` will exclude it
* Method `.to_a` will put the numbers/strings that belong to the calling
  range into an array
* Method `.to_enum` will turn the range into an enumerator, so `.next`
  will return the successive element
* Methods `.include?(num)` will test if the number given as a parameter
  belongs to the range, and you can use `.inject(:+)` to get the sum
  of all elements
  calling range, `.max`
```ruby
numbers = (1..6).to_a   # => [1, 2, 3, 4, 5, 6]
numbers.include?(5)     # => true
numbers.max             # => 6
numbers.inject(:+)      # => 21
```
* To test whether a value belongs to an interval/range, use the triple
  equal operator `===` or `case` and `when/else`:
```ruby
(1..10) === 5           # => true
(1...10) === 10         # => false
('a'...'m') === 'f'     # => true
('a'...'m') === 'p'     # => false

case 3
when 1..4
  puts "Yes"
else
  puts "Nope"
end
```


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
* Methods `.size` and `.length` return number of elements in array
* Methods `.inspect` and `p array` print all of elements of the array
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
* Method `.include?(object)` will return `true` if `object` is present
  in the array, otherwise returns `false`
* Method `.delete(object)` deletes the given object from the array if
  present, if not present returns `false`
  * You can attach block code to this method, that will execute it if
    the object is not found, and return its value
* Method `.uniq` returns the array with all duplicates removed



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
* Storing a value in the hash can be done with `.store(key, value`, or
  with the operator `[]=`, e.g. `food['apple'] = 'sweet'`
* Method `.clear` will delete all key-value pairs from the hash
* Method `.default` returns default value for new keys, if unassigned
  returns `nil`; you can set it using `=`
* Method `.delete(key)` will remove given key-value pair from the hash
* Like arrays, you have `.delete_if { |key, value| ... }` to delete all
  key-value pairs for which the block code returns `true`
* Method `.empty?` returns `true` if hash has no elements
* Method `.each { |key, value| ... }` iterates over the hash elements,
  giving their values to the code block
  * Use `.each_key { |value| ... }` to work with the values only
* Methods `.has_key?(key)`, `.include?(key)`, and `.member?(key)` return
  `true` if `key` is present in the hash, otherwise returns `false`
* Method `.fetch(key)` returns the value from the hash for the given key
  * Add a block code `{ |key| ...}` and it returns its value
  * Provide a second parameter to the method to define a default value,
    if the one you're searching for is not found
* Method `.value?(value)` returns `true` if `value` is present as a
  value in the hash, otherwise returns `false`


## Symbols

* *Symbols* are constant names that are guaranteed to be unique, so they
  don't need to be predeclared
* The name of a symbol starts with a colon : `:cookie`
* You don't have to assign it a value and Ruby makes sure the symbol
  has the same value no matter where you use it
* Frequently used with hashes, since keys must be unique


## Constants

* *Constants* are named values that never change throughout the program
* Their names are written in capital letters, e.g. `ANSWER = 42`
* They cannot be declared within methods, only in a class or globally
* You can access their values using the double colon `::` from outside
  a class, e.g. `Dogs::KIND # => "canine"`, or `::KIND = "feline"` if
  inside a module/method


## Structs

* *Structs* are objects that contain a given set of attributes
* Creating a struct is done by instantiating it, and providing the
  attributes as symbols, e.g. `Song = Struct.net(:artist, :title)`
* Keeping structs in an array is a good idea, especially if you have
  many things of the same kind that have more than one value


## Conditional structures (if, unless, case)

* *Conditionals* provide us way to change the way code executes
  depending on given conditions
* Any value is considered `true`, except `nil` and `false`
* The `if` control structure executes code if the given condition
  evaluates to `true`, `elsif` gives another condition if the previous
  is `false` (you can have more than one `elsif`), and `else` executes
  if the conditions of `if` and all of `elsif` are not fulfilled:
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
* If you want to put the code needed to be executed at the same line as
  the condition, put `then` after the condition:
  `if Time.now.friday? then puts "It's friday!" ; puts "Great!" end`
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
* `unless` is similar, but executes code if the given condition
  evaluates to `false`, otherwise code block after `else` is executed
  if condition evaluates to `true`
* If you want to put the code needed to be executed at the same line as
  the condition, put `then` after the condition
```ruby
today = Time.now

unless today.saturday?
  puts "It's not the weekend, yet!"
else
  puts "Weekend arrived, enjoy yourselves!"
end
```
* Instead of using `if` and lots of `elsif`s when you need to compare
  the resulting value of expression with many other values, use `case`
* After `case` specify the expression to be evaluated,
  * on the next line provide `when` and one or more expressions or
    values (separated by commas `,`) to compare using the `===` operator
  * for each `when` expression that returns `true`, its code block will
    be executed
  * you can provide `else` and code block in case no `when` conditions
    got matched
```ruby
temperature = 37

case temperature
when 34..36
  puts "too cold"
when 36, 37
  puts "just fine"
when 38..42
  puts "too hot"
else
  puts "thermometer is broken"
end
```
* For fans of the C programming language, the conditional expression
  `variable = expression ? true_value : false_value` is also present, it
  will evaluate the expression, and if it returns `true`, it returns the
  value of expression `true_value`, otherwise it returns the value of
  expression `false_value`, and it is assigned to `variable`


## Loops (while, until, for, loop)

* *Loops* allow us to execute a block of code repeatedly
* Use `while` to execute in loop a code block as long as the given
  condition evaluates to `true`
  * Put `do` between the condition and the first line of code if they
    are written in the same line
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
* `until` is similar to while, but it executes the code block if the
  condition evaluates to `false`
```ruby
count = 1
print "Counting to 10: "

until count > 10
  print count, ", "
  count += 1
end

puts "\b\b."
```
* Use `for` to execute code for each value of a given expression or
  collection (array, hash)
  * After `for` provide the variable (or more, separated by commas) that
    will take values, `in` and then the expression to evaluate or the
    array/hash to get the elements from
  * Separate code from the expression using `do` if in the same line
```ruby
animals = { cat: 'black', dog: 'white', mouse: 'gray' }

for animal, color in animals
  puts "The #{animal} is #{color}"
end
```
* For these loops, if you need to exit from a loop, put `break` at any
  point within the code block
* If you need to go to the next iteration of the loop and skip this one,
  put `next` at any point ih the code block
```ruby

for i in 0..6
  # Less than 2? skip it, increment 'i' and loop again
  next if i < 2

  # Greater than 4? stop looping
  break if i > 4

  puts "Counting: #{i}"
end
```
* In a `for` loop, to perform the loop again with the same value(s), use
  `redo`; it will restart the `yield` or `call` if within a block
* In a `for` loop, `retry` will start the loop from the beginning, from
  the first value(s)
* `loop` will simply execute a given block of code repeatedly, until
  you `break` out of it; be careful not to go into an *infinite loop*


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
  * `/ab?c/` - match string with `a`, followed by zero or one `b`,
    followed by `c`
  * `/ab{m,n}c/` - match string with `a`, followed by minimum `m` to
    maximum `n` `b`'s, followed by `c`
  * `/ab{m}c/` - match string with `a`, followed by exactly `m` `b`'s,
    followed by `c`
* We can specify *character classes* to match a group of characters:
  * `\s` - match whitespace (space, tab, new line)
  * `\S` - match any character which is not whitespace
  * `\d` - match any digit [0-9]
  * `\D` - match any character which is not a digit
  * `\h` - match any hexadecimal digit [0-9a-fA-F]
  * `\H` - match any character which is not a hexadecimal digit
  * `\r` - match any linebreak sequence (\n, \r, \r\n)
  * `\w` - match anything which can be a part of a word (letters,
    numbers, and an underscore `_`)
  * `.` - match any character except a new line
  * `\A` - match at beginning of string
  * `\z` - match at end of string, `\Z` same but just before newline if
    present at the end of string
  * `\b` - match word boundaries
  * `\B` - match non-word boundaries
* Group expressions using parentheses `()`, they are treated as a sub
  regexp, and return the results as separate elements in an array
* A `^` before a character inside `[]` means don't match: `/^\d\d/`
  will not match any two digits one after another
* Putting brackets `[]` and a dash `-` between modifiers creates ranges:
  `/[a-z0-9]/` means match one lowercase letter or a digit
* Use *anchors* `^word` to match only at the beginning, or `word$` to
  match only at the end of the string
* To match a string against a regular expression, use operator `=~`
  * It returns a number from where the string matches the regexp, and
    `nil` if it does not match
  * The operator `!~` returns `true` if the regexp does not match
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
* Add exclamation mark `!` after these methods' names to modify the
  original string instead, and return `nil` if there s no match
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
* Refer to these [truth tables](https://en.wikipedia.org/wiki/Truth_
table#Truth_table_for_all_binary_logical_operators) for details
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
* Code blocks are *anonymous methods* (without a name) and can be used
  as objects, stored in variables, passed as arguments, and called
  * Their state is preserved while the program is running
* When the last parameter of a method definition is prefixed with an
  ampersand `&`, the code block associated with the method call will be
  converted as an object of class Proc and assigned to the parameter
  * You can treat is as a variable, pass it to other methods, call it
    using `.call(parameters)`, e.g.:
```ruby
def say_hello(name, &block)
  print "Hey, it's me! "
  block.call(name)
end

say_hello('Mark') do |name|
  print "Hello, #{name}!"
  puts
end
```
* Another example using the Proc class:
```ruby
class ProcBlock
  def store_block(&block)
    @block = block
  end
  def use_block(parameter)
    @block.call(parameter)
  end
end

pinky = ProcBlock.new

# Store the code block after the method call
pinky.store_block do |param|
  puts "Code block called with parameter: #{param}"
end

# Call the stored code block and pass a parameter
pinky.use_block('testing')
pinky.use_block(42)
```
* Another way of creating objects out of code blocks is by using
  `lambda`, e.g.:
```ruby
cody = lambda { |n| puts "Hello to #{n}!" }

cody.call 'Rex'
cody.call 123
```
* Blocks can also behave like *closures* - variables in the scope of a
  method, where the block code is located, can be accessed by that
  block code as long as it exists, and as long as any Proc object
  created by that block code exists, e.g.:
```ruby
def powerof2_generator
  # This variable will be accessed by the lambda block code
  # and its value will be preserved as long as the block code exists,
  # even though it is not inside the block code
  value = 1
  lambda { value += value }
end

powerof2 = powerof2_generator

print "Generating some powers of 2: "
10.times { print powerof2.call, " " }
```
* Alternative syntax for creating Proc objects: `-> param { }`, e.g.:
```ruby
randy = -> name { puts "Hello, #{name}!" }

randy.call "Jack"
randy.call "Stella"
```
* Passing arguments to a block code using new notation:
```ruby
block2 = -> name, *things, &block do
  print "Hey, #{name}! This is yours: "
  things.each { |x| print x, ", "}
  puts "\b\b."
  block.call(name)
end

block2.call('Theodore', 'books', 'cheesecake') do
  puts "That's all, #{name}!"
end

# Output:
# Hey, Theodore! This is yours: books, cheesecake. 
# That's all, Theodore!
```


## Command line arguments and environmental variables

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
* The hash `ENV` allows you to access shell's environmental variables
  * If you change any environmental variable, it will only reflect on
    your program's environment and its children processes
  * Setting an environmental variable to `nil` undeclares it
* Name of your Ruby program is stored in `$PROGRAM_NAME` globar variable


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
    "Fruit: #{@kind}\nPrice in local currency per kg: #{@price} RSD"
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
* Use `self` to access methods and constants of the current object only


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
* The operator `||=` will assign a value to a variable only if it
  doesn't already have a value set: `var ||= "default value"`
  * Check if a value is defined using method `.defined?` on a variable,
    it returns `true` if refine, or `false` if it's not


## Iterators

* *Iterator* is a method that invokes a block of code repeatedly, and
  gives it values from a collection
* Method `.each` returns value (from array) or key-value (from hash)
  to a block and executes this block repeatedly for each element, e.g.:
```ruby
animals = [ "dog", "cat", "mouse", "duck", "lizzard" ]
animals.each {|animal| print animal, ', '}  # Interation over an array
puts "\b\b."
```
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
* You can attach method `.times` to a number to loop the code block
  the given number of times, e.g.:
```ruby
20.times { print '* ' }  # Prints 20 stars :)
```
* Provide a character/number range `(a..z).each` to iterate over it:
  * `(0..10).each` returns the numbers from 0 to 10, but `(0...10).each`
    returns numbers from 0 to 9, 10 excluded - be careful!
```ruby
(1..20).each { |digit| print digit, " " }  # Prints numbers from 1 to 20
puts
```
* Method `.inject` is used to accumulate a value across the members of a
  collection, while yielding the code block attached after it, providing
  it with two values, first being the inject's parameter, second being
  current element from the iteration; observe this example:
  `[2, 4, 6, 8].inject(0) { |sum, element| sum+element } # => 20`
  * First time it is called, first variable `sum` will have value
    provided as inject method's parameter (0), second variable `element`
    will have value of the first element of the array (2)
  * `sum+element` will be evaluated (2 + 0 = 2) and value goes in `sum`
  * On the next iteration, `sum` is 2, and `element` is 4, `sum+element`
    is 6 and goes in `sum`
  * Once the last iteration on the last element is finished, `.inject`
    returns the value `sum`
  * If no parameter provided, first element of the collection is taken
    as parameter, and iteration starts with the second element, so in
    this case this code means the same:
    `[2, 4, 6, 8].inject { |sum, element| sum+element } # => 20`
  * You can also provide an operator as a symbol, instead of a code
    block, and that operation will apply to all the elements, e.g.:
    `[2, 4, 6, 8].inject(:+) # => 20`


## Enumerators

* When you need to iterate over two collections in parallel, or if you
  need to treat the iterator as an object, to pass it to a method that
  needs access to all the values returned by that iterator, you need to
  use *external iterators*, called *enumerators*
* Method `.to_enum` will create an enumerator object when called on
  a collection (array or hash)
* Another way of creating an enumerator is `enum_a = array.each` for an
  array, or `enum_h = hash.each` for a hash
```ruby
array = [2, 4, 6, 8, "doge", "cate", "mouse"]
hash = { dog: "Toby", cat: "Munchkin", mouse: "Tutchell" }

enum_a = array.to_enum
enum_h = hash.to_enum

enum_a.next   # => 2
enum_h.next   # => [:dog, "Toby"]
```
* There is a special method `loop` that loops on enumerators within a
  code block until one of them runs out of elements first, useful for
  calling two or more enumerators in parallel, e.g.:
```ruby
fruits = [ 'apple', 'orange', 'banana', 'kiwi' ]
colors = [ 'red', 'orange', 'yellow', 'brown', 'green', 'white']
fruits_enum = fruits.to_enum
colors_enum = colors.to_enum

loop do
  puts "#{fruits_enum.next} - #{colors_enum.next}"
end

# Output:
# apple - red
# orange - orange
# banana - yellow
# kiwi - brown
```


## Enumerators as generators and filters

* Enumerators can be explicitly created by adding a code block when
  creating them, which will be called whenever the enumerator needs to
  get another value for the program
* This code block is executed in parallel; it starts at the top of the
  block, pauses when the block yields a value and calls your code, i.e.
  another attached block to the explicitly created enumerator; when your
  attached code block needs another value, the enumerator continues
  executing code in its code block after `yield`
* This way, you can generate infinite sequences of numbers, for example
* Enumerator objects are also enumerable, as arrays are, so you can use
  methods like `.first` on them
* Generating infinite sequences sounds great, but not if you use
  `.count` or `.select` on them, so it is good to implement a method
  where it takes the enumerator object and the block of code as
  parameters, and returns values from the enumerator if the block of
  code evaluates (returns) true
```ruby
# 'yielder' is a new enumerator object
triangluar_numbers = Enumerator.new do |yielder|
  number = 0
  count = 1

  loop do
    number += count
    count += 1

    # Call the enumerator object and return the number
    # It gives a value back, and when we evaluate triangular_numbers
    # once again, execution continues after yield - the loop will repeat
    # again and yield another value
    yielder.yield number
  end
end

# Using an enumerator object as a generator of numbers
10.times { print triangluar_numbers.next, " " }
puts

# Extend the Enumerator class with a method, that returns values from
# the enumerator object only if the code block attached to this method
# evaluates to 'true'
class Enumerator
  def infinite_select(&block)
    # Create a new Enumerator object
    Enumerator.new do |yielder|
      # For each value the enumerator object returns,
      self.each do |value|
        # Call the code block passed as a parameter,
        # return a value if it evaluates to 'true'
        yielder.yield(value) if block.call(value)
      end
    end
  end
end

# Return first 5 triangular numbers that can be divided by 10,
# and that contain the digit 7
p triangluar_numbers
                    .infinite_select { |val| val % 10 == 0 }
                    .infinite_select { |val| val.to_s =~ /7/}
                    .first(5)
```
* Working with infinite sequences can be made easier by using *Lazy
  Enumerators*, which are enumerators with methods like `map` and
  `select`, and they only retrieve data from collections when requested
  * They return enumerators which apply only the logic of the method
    used to call them
* Creating a lazy enumerator is done by adding `.lazy` at the end of its
  code block
```ruby
def Integer.all
  Enumerator.new do |yielder, n: 0|
    loop { yielder.yield(n += 1)}
  end.lazy
end

print "First 7 positive integers: "
Integer.all.first(7).each { |i| print i, " " }
puts
```


## Class inheritance

* *Class inheritance* allows us to reuse code of another class, the
  *superclass* or *parent* class, and have all of its methods and global
  variables available to our *subclass* or *child* class
* If you do not define a superclass, then your class inherits from the
  Object class, which inherits from the BasicObject class, which has no
  superclass
* Usually class inheritance is used to create a class that is a
  specialization, or refinement, of another class, or to add specific
  behaviors to a standard library class for your application
* The subclass inherits the methods and constants of the superclass
* If we want to share variables, they need to be declared as *class
  variables*, their name must start with `@@`, e.g. `@@no_of_carrots` -
  this way all objects that are instances of the same class will have
  access to the same variable
* Performing inheritance is done when declaring the subclass, by putting
  the less-than sign `<`, space, and then the name of the superclass:
```ruby
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
  def initialize(name, thing)
    super name, thing  # Call the superclass's method with the same name
  end
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
```
* Use `super` within a subclass method, and provide arguments if
  necessary, if you wish to invoke the superclass's method with the same
  name, e.g. the subclass's method is `.play`, write `super(song)` in
  the subclass's method definition


## Modules and mixins

* *Modules* are a way of grouping methods, classes, and constants
  together; they provide a *namespace* and prevent name clashes, and
  support the mixin facility
* Module is defined by writing `module`, then a name for the module with
  a first capital letter, methods' and constants' code and definitions,
  all terminated with `end`, e.g.:
```ruby
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
```
* When defining methods that are part of a module, prefix their name
  with module's name followed by a dot, e.g. `def Namespace.method`,
  calling the methods that belong to a module is same as we define them:
  `Namespace.method(parameters)`
* Define constants in modules with all capital letters, e.g. `NUM_BOOKS`
* To access a constant's value, write the module's name, two colons `::`
  and then the constant's name, e.g. `Books::NUM_BOOKS`
* Since modules aren't classes, they can't have instances, but you can
  include modules in class' definitions, so modules' methods become
  available as instance methods to a class - these modules are *mixins*
* This flexible mechanism allows classes can share methods that are
  common to them, reusing code and avoiding duplication
```ruby
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

cat = Cats.new('Lynx', 'Siamese', 2)
cat.tell_about

# Output: This is Lynx, a Siamese, and it's 2 years old.
```
* Use `self` when calling the class's object instance method where the
  mixin is included, e.g. `self.make_noise`
* Avoid using instance variables directly, instead use accessors to get
  data from the object, to avoid hard to diagnose bugs
* Avoid keeping state in a mixin, use a class instead
* Resolving method names, in order: object's class, class's mixins,
  superclass, superclass's mixins


## Exceptions

* Errors happen constantly, and it's our job to handle them gracefully
* *Exceptions* allow us to handle errors by packaging information about
  them and sending it to the runtime system, which will find the code
  that handles the error and let it perform error handling
* Information about an exception is stored in an object of Exception
  class or its subclasses
* To raise an exception, use one of the Exception classes, and create
  your own class, define it as a subclass or StandardError or one of its
  subclasses, or they will *not* be caught
* Every Exception has a message string and a stack backtrace
* To do exception handling, put the code that could rise an exception
  between `begin` and `end`, and the use one or more `rescue` clauses in
  it, with the name of the exception class specified in the same line,
  e.g. `rescue Exception` for all exceptions
  * After handling the exception with the rescue code, use `raise` to
    raise it again, so if you cannot handle it another rescue code will
  * A reference to the exception object is stored in the `$!` global
    variable, and it will be raised when we use `rescue`
* You can have multiple `rescue` clause in a `begin` block and each can
  specify multiple exception classes separated by comma `,`, and also
  you can provide a variable to hold the matched exception after `=>`:
```ruby
begin
  eval string
rescue SyntaxError, NameError => err
  print "String does not compile: " + err
rescue StandardError => dang
  print "Error running script: " + dang
end
```
* If an exception rises, and no `rescue` clause matches it, or it is
  raised outside of a `begin-end` block, Ruby will go up the stack to
  the caller method and see if there are any exception handlers there
  for that type, and if not then go up again and search, and so on
* System errors are raised when a call to the operating system returns
  an error code; on POSIX systems and Linux, you can see the error
  codes' names with the command `man errno` in your command line shell
* They are wrapped in specific exception objects, subclasses of class
  SystemCallError, and each defined in a module Errno
* If you want to execute code if no exception raises, put it in an
  `else` block, that must be after all `rescue` blocks
* Sometimes you must guarantee that some code will execute at the end,
  whether an exception was raised or not, and for that purpose you can
  place an `ensure` block after all `rescue` blocks and an `else` block
* Use `retry` within a `rescue` block if you handle the exception
  gracefully and would like to do the `begin` block code again
* You can raise exceptions by using `raise` method
  * No parameters means reraise the current exception, when within a
    `rescue` block (or RuntimeError, if no exception happened before)
  * One string parameter means raise an RuntimeError exception, to be
    intercepted by an exception handler and passed to the appropriate
    one, the string being a message
  * Three parameters can be provided, where first will be the exception
    class, second is the message, and third is the variable that will
    contain the stack trace
* Sometimes it might be necessary to get out of a deeply nested loop,
  and for that you can use `catch(label)` to mark a block of code for
  execution, `label` being symbol or string, and then put
  `throw(label, string)` anywhere in the block code, where label should
  be the as the parameter of `catch`, and the optional second parameter
  a string to return
  * If you assign the `catch` block code to a variable, its value will
    be the string returned by `throw`


## Files and Input/Output

* Besides the basic input/output facilities provided by Ruby, we can
  also find a base class called IO that provides a bidirectional channel
  between a Ruby program and other resource (file, network socket)
* This class provides two basic subclasses, File and BasicSocket, that
  work on the same principles
* A file is a unit in the file system whose purpose is to store data, so
  we can store the results of our calculations and restore them later
* The File class provides the facilities for working with files  
* To use files, we need to open them first, and close them once we are
  finished with them
* When you create a new file object, you can give two parameters to the
  `.new` method you're calling, first is the file name, and second is
  the mode string, which tells the system you want to read a file, write
  to it, or do both, and these are:
  * `r` - read only, start from beginning of file (default)
  * `r+`  - read and write, start from beginning of file
  * `w` - write only, truncates file to zero (deletes everything!) and
    starts writing from beginning of file, or creates a new one
  * `w+` - read and write, truncates file to zero and starts from
    beginning of file, or creates a new one
  * `a` - write only, starts at the end of file if exists (append mode),
    or creates a new one
  * `a+` - read and write, starts at the end of file if exists, or
    creates a new one
  * `b` - binary mode, can be combined with any of the above, used when
    we work with sockets and bytes (binary data, instead of text)
  * E.g. `homework = File.new("maths.txt", "a+")`
* You can use `.open` and associate a code block with it, it will give
  the file as a variable, and after the code block finishes execution
  it will automatically close the file
  * Useful in case an exception occurs, because the file will be closed
    automatically, else it may stay open until the program ends, using
    unecessarily precious system resources
* After you finish working with a file object, use `.close` to close it
* Method `.gets` reads a line from file, method `.puts` writes a line to
  file, the same methods we've used for text input/oputut on the console
```ruby
File.open("test.txt", "r") do |file|
  while line = file.gets        # as long as there are lines in file,
    puts line                   # show each of them on screen
  end
end
```
* You can use iterators to read file's contents and parse them:
  * line by line by using `.gets`
  * by bytes (octets) using `.each_byte`
  * by lines using `.each_line(separator),` optional parameter is a
    string that will be used as separator of lines, default is new line
* You can also create an iterator using the `IO.foreach(file, mode)`
  class method, each time it is called will return the next line of file
  and close file automatically, e.g.
  `IO.foreach("example.txt") { |line| puts line }`
* Writing to a file can be by calling `.puts`, `.print` and `.printf`
  from the IO object, just like writing text on the screen
  * Use `.write(string)` method to write string in a file
  * In all cases, file must be open for writing!
* If you work with binary data (bytes, octets) directly, you can also
  use `.sysread(num_bytes)` and `.syswrite(chars)`
* There is a StringIO class that provides objects that are similar to
  File objects, but they read and write strings and not files
  * Use `require stringio` before you create these objects
```ruby
require 'stringio'

str_in = StringIO.new("Lorem ipsum dolor sit amet.") # To read from
str_out = StringIO.new("", "r+") # Empty StringIO object to write into

print "\nSentence to modify: #{str_in.string}\n"
str_in.each_line do |line|
  str_out.puts line.reverse
end
puts "The sentence in reverse: #{str_out.string}"
```


## Sockets and networking

* Communicating over a network is done using a sockets interface, which
  is defined in the Socket class, a subclass of IO class
* *Sockets* are the endpoints of a bidirectional communications channel
  * They may communicate within a process, between processes on the same
    machine, or between processes on different continents
* The library provides methods for working with TCP, UDP, Unix and other
  kinds of sockets, as well as helping us implement servers
* To use the sockets library, add `require 'sockets'` in your code
* There parameters describe a socket:
  * domain - family of protocols that areused as means of data transport
  * type - type of communication between two endpoints, `SOCK_STREAM`
    for connection-oriented protocols (very common), and `SOCK_DGRAM`
    for connectionless protocols
  * protocol - usually zero, used to identify a variant of a protocol
    within a domain and type
  * hostname - the identifier of a network interface: host name, e.g.
   `semaphoreci.com`, or IP address (IPv4, IPv6), e.g. `127.0.0.1`
  * port - servers listen to one or more ports where clients call, an
    integer number or name of service, e.g. `telnet`, `web`, etc.
* The *server* opens one or more ports and waits for a connection from
  a *client*, then provides data to the client and performs computations
  for it, and returns results
* TCPSocket and UNIXSocket are classes that provide connection-oriented
  sockets for clients - there is retransfer of data in case of mistakes
  in communication, by acknowledging the receival of packet data, and
  UDPSocket is a datagram-oriented protocol - it does not check whether
  data arrived at the other side or not
* These classes have corresponding TCPServer, UNIXServer, and UDPServer
  classes that are used to implement the server side of communication
  * Or you can bind a socket to a port using `.bind(port)`
* Creating a TCP connection to a server can be done by creating a new
  TCPSocket object, or by using its `.open(address, port)` method, e.g.:
  `server_connection = TCPSocket.open('localhost', 12000)`
* Since these Socket and Server classes are all subsets of IO class, you
  can call the familiar input/output methods, such as `.puts`, `.gets`,
  `.print`, `.write`, etc., just call them from the Socket object
* When you're finished with the communication, close the socket using
  method `.close`
* Only one server can bind to a socket and listen on it for connections,
  and one or more clients can connect to it
* Handling more than one client connection is possible by using threads
* A client cannot connect (i.e. it will fail) if the server is not bound
  and listening on the port
* The client and server can be on the same machine, or usually on
  different machines and networks
* Example server (make sure it is running before running client):
```ruby
require 'socket'
server = TCPServer.new(12345)   # Server bound to port 12345

loop do
  client = server.accept        # Wait for a client to connect
  client.puts "Hello from the server!"
  client.close                  # Close connection
end
```
* Example client:
```ruby
require 'socket'
server = TCPSocket.open(localhost, 12345)

while line = server.gets
  puts line                     # Show on screen what the server sends
end
```
* Opening and using web pages and web resources directly can be done by
  importing `require 'open-uri'` and using `open(url)` to get the file;
  HTTP redirection and protocol necessities are handled automatically:
```ruby
require 'open-uri'

# Opens the web page and gets index.html
open("http://www.google.com") do |f|
  puts f.read               # Show HTML code on screen
end
```
* If you need to parse HTML, use the excellent Nokogiri library (install
  it using `sudo gem install nokogiri` in your shell (command line), or
  using your package manager; afterwards, use it by putting `require
  'nokogiri` in your code:
```ruby
require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("http://www.google.com"))

puts "Page title: " + doc.xpath("//title").inner_html
```


## Fibers

* Ruby provides facilities that allow us to execute different parts of
  the program at the same time
* In reality, computers switch extremely rapidly between many processes
  and run them one-by-one in a limited time, and since this is so fast
  we perceive it as if everything is running and the same time
  * The kernel coordinates the execution of many processes concurrently
* *Fibers*, so-called lightweight threads, are used to implement
  coroutines, and are used for generating infinite sequences as well
* Create a fiber and attach a code block to it:
```ruby
words = Fiber.new do
  File.foreach("a_story.txt") do |line|
    # Get words from the file
    line.scan(/[\w']+/) do |word|
      Fiber.yield word.downcase   # Yield a word and wait for .resume
    end
  end
end

# Yield a new word each time we resume the fiber, 10 times
10.times do
  puts words.resume
end
```
* The fiber starts execution once you `.resume` it, and then on each
  `.yield` will stop, return a value, and wait for you to `.resume` it
  again; after it finishes (in this case, after it runs out of words),
  the fiber will be terminated
* Fibers can be resumed only in the thread that created them!


## Threads
* Although Ruby does use the threading mechanism of the operating
  system it runs on, since most of the code is not thread-safe (imagine
  accessing a file while someone is writing to it at the same time, for
  example, data loss can occure), it executes one thread at a time
* *Ruby Threads* can be used to achieve parallelism, and make two or
  more code blocks execute at the same time
```ruby
sweets = ['cookies', 'jelly', 'chocolate', 'candy', 'cake']

threads = sweets.map.with_index do |sweet, index|
  Thread.new(sweet, index) do |piece, i|
    print("Hey, it's thread no. #{i+1}, I have some #{sweet}!\n")
  end
end

threads.each { |thread| thread.join }
```
* Since threads share all variables with the environment they are
  created in, and we don't want to cause collision (one thread changing
  value of a variable while another one is accessing it), we pass what
  we need as parameters in `.new(param, param)`, since variables within
  the code block are local to the thread
  * Use `print("text\n")` instead of `puts("text")`, because outputting
    the new line in `puts` is a separate step, and in the meantime
    another thread may execute and output some other text
* All threads are killed, regardless of their state, once a Ruby program
  stops execution; if you want to wait until a thread finishes, on the
  Thread object call the method `.join(timeout)`, the optional parameter
  says how many seconds it will wait for the thread to finish before
  terminating it and returning `nil` instead
  * `.value` will do the same as `.join`, but it will return the last
    result of the execution of the thread
* Access the current thread from within it using method `Thread.current`
  and a list of all threads is returned by method call `Thread.list`
* `Thread.status` and `Thread.alive?` show whether a thread is running
  or it finished and is terminated
* If you want to store variables that will be shared among the running
  threads, you can use the thread object's name as a hash within or
  outside the threads, e.g. `Thread[name] = "dog"`, `puts Thread[name]`
* If an unhandled exception happens within a thread, the thread will be
  terminated, and the rest of threads will continue running
  * Set `Thread.abort_on_exception = 1` to the thread object and start
    the Ruby program with the debug flag, i.e. `ruby -d ./program.rb`
    and the main program thread will get terminated, and RuntimeError
    will be raised as well
* To avoid race conditions and allow only one thread to access resource
  at a given time, we can use a *Mutex*, and the Mutex class provides us
  with a Mutex object that will control the threads' behavior
* Make an instance of a mutex with `mutex = Mutex.new`, and within the
  thread code block you can use `mutex.lock` to lock the variables for
  exclusive access to the current thread, and then `mutex.unlock` to
  unlock them so other threads can access them
  * Method `.try_lock` on a mutex will return `true` if the mutex lock
    can be activated in the thread and do the lock as well, and `false`
    if some other thread locked the mutex already
  * Method `.sleep(time)` will suspend the mutex lock and resume it
    after `time` seconds


## Processes

* *Process* is a group of instructions (program) that is running
* You can spawn (create) new processes by using method `system("cmd")`,
  or write a shell command between backticks ` 
* How are new processes created? By making a copy of the current process
  and executing another code instead! This is called *forking*
* You can capture the shell command's output in a variable as a string
  if you use the backticks to give the command
  * Use `.chomp` to remove the new line at the end of the result
* If you use `system`, the output is shown on screen, and it returns
  `true` if the program is found and executed successfully, or `false`
  if the program is found but did not execute successfully (the error
  code is not 0); an exception will be raised if program is not found
* These commands are useful if we only need to return status or capture
  text program output, but if we want to establish a bidirectional
  communication and send data to a program through a pipe, then we can
  instance an IO object using the class method `.popen("cmd", "r|w+")`,
  which allows us to write to a process's standard input and read from
  its standard output (it will start and work in parallel with program)
```ruby
IO.popen("figlet", "r+") do |fig|
  fig.write("Hello!")
  fig.write(" How are you doing?")
  fig.close_write
  puts fig.read
end
```
* You must use `.close_write` to flush the write buffers (unfortunately,
  it will not let you write to the process again, no solution yet),
  otherwise your program will hang as the system waits for you to close
  the write channel
* If the first parameter is `-`, it starts a Ruby interpreter instance
* Method `exec("cmd")` will execute a program in a new process, and
  method `fork` returns the ID of this new *child process*; the *parent 
  process* will continue execution, e.g.:
```ruby
# Create a child process if in parent process
# Children processes get nil from fork.nil?, parent processes
# get the process ID of the child process
exec("figlet", "abracadabra") if fork.nil?
puts "Parent process here!"
Process.wait
```
* To get the child process's ID, method `Process.wait` will return it
  and also wait for the child process to finish execution
* Method `trap("CLD")` can be used to trap (catch) when a child process
  stops execution, if you do not want to wait for it to finish instead
```ruby
trap ("CLD") do
  pid = Process.wait
  print "\nChild PID: #{pid}: terminated\n"
end

fork { system("ls", "-l") }
sleep(1)    # Some waiting is necessary to avoid premature termination
```
* Global variable `$$` returns child process's ID, and `$?` returns info
  about last terminated child process


## Unit testing

* *Unit testing* is testing focused on small units of code, methods or
  code lines within methods, which are parts of a bigger program
* Writing tests is important, and unit tests allow us to check our code
  well and ensure it works properly, so that when we use it in more
  complex scenarios it will not cause hard-to-spot errors
* Two libraries are used to provide unit testing facilities,
  MiniTest::Unit and Test::Unit
* For standard Unit Tests, use `require 'test/unit'`, and for raw
  MiniTest, use `require 'minitest/unit'`
* *Test cases* are the groups of tests that target a certain part of the
  program, and what provides the tests are the test methods
* We can group all these test into *test suites*, to be run as a group
* Test classes must be subclasses of `Test::Unit::TestCase`, and every
  method that will provide assertions or refutals must have a name that
  starts with `test`
* Unit tests are supposed to run fast, be independent of context, and
  easy to set up
* Writing a test for a class:
```ruby
# Original class in a file called my_class.rb

class Sugar
  def initialize(sweet)
    @sweet = sweet.to_s
  end

  def to_s
    @sweet
  end
end
```
* The unit test is:
```ruby
# Unit test for class Sugar in a file called unit_test.rb

require_relative 'my_class.rb'
require 'test/unit'

class TestSugar < Test::Unit::TestCase
  def test_simple
    # Will it return "candy"?
    assert_equal("candy", Sugar.new("candy").to_s)
  end
end
```
* After running `unit_test.rb`, you will get the following:
```
Loaded suite unit_test
Started
.

Finished in 0.000556456 seconds.
------------------------------------------------------------------------------------------------------------------------
1 tests, 1 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
100% passed
------------------------------------------------------------------------------------------------------------------------
1797.09 tests/s, 1797.09 assertions/s
```
* As we can see in the result, the test has passed, giving us confidence
  that for the given use case, the code will perform correctly and
  return the correct value (the one we expected)
* Within each test method, you can put methods for assertion to check
  whether the output of a certain method is what we expect, e.g. the
  `assert_equal("candy", Sugar.new("candy").to_s)` test will pass if and
  only if the return value of the method call is string `"candy"`
* Method `refute_equal("candy", Sugar.new("candy").to_s)` would do the
  opposite, the test will pass if and only if the method call's return
  value is NOT the string `"candy"`
* Methods `assert_nil` and `refute_nil` test whether a method call will
  return `nil` or not, and assert or refute this
* Define method `setup` to prepare the testing environment (connect to a
  database, for example), and define method `teardown` to close files
  and settle everything after tests the way it was before them
* To run a particular test, we can call the unit test Ruby program with
  a parameter `-n test_name` and provide the name of the test method to
  run, e.g. `ruby unit_test.rb -n test_simple`
  * Instead of a test method name, provide a regular expression as an
    argument, e.g. `ruby unit_test.rb -n /simple/` to perform all tests
    whose names match the regular expression `/simple/`
* Names of test programs should be `ts_xxx.rb` or `tc_xxx.rb`, or simply
  `test_connectivity.rb`, `test_playback.rb`, etc.
  * One test program may `require` the others, so that when you perform
    the tests it will perform the required ones as well


## Profiling

* Ruby comes with a built-in profiler tool that will show you which
  methods have been called throughout the runtime of the program, how
  many times have been called, and how much time did the program spend
  executing that code
* Run your Ruby application in the command line like this:
  `ruby -r profile my_program.rb` - calling Ruby with `-r profile` as an
  argument will profile the application and give you statistics in the
  standard output once the application exits
* The profiler is a very helpful tool, to see what is your application
  doing most of the time, so you can rewrite the methods that are
  called the most and make them work faster and more efficient


## RSpec and Shoulda

* Behavior-driven development encourages people to write tests in terms
  of their expectations of program's behavior for given circumstances
* Similar to testing according to users' stories, the focus is not on
  assertions, but on the expectations of how your programs works
* Two test methodologies are popular: RSpec, a testing framework focused
  on design of code; and Shoulda, a component that can be mixed with
  Rspec, and is focused on tests
* Install RSpec by typing the following in your command line:
  `sudo gem install rspec`
* Also, install Should by typing the following in your command line:
  `sudo gem install shoulda`



## Organizing source code and files

* To simplify code management, we should organize code and resources
  in a certain hierarchy, and this one provides a good example:
```
application/          <= Top-level directory containing the program
  bin/                <= Programs, command-line and/or GUI interfaces
    program_name.rb
  doc/                <= Documentation and help files
  ext/                <= Extensions for C interface (optional)
  lib/                <= Shareable modules, classes and methods
    module_name/
      sing.rb
      dance.rb
      play.rb
  test/               <= Unit tests
    unit_test.rb
  INSTALL
  LICENSE
  README
  TODO
```
* Put all your classes and methods inside a module, to avoid any
  namespace collisions
* Running the program: `ruby -I lib bin/program_name.rb`


## Ruby Gems

* *Ruby Gems* is a standardized packaging and installation framework for
  Ruby programs and libraries, which makes it easy to install, upgrade,
  and remove Ruby packages
* Packages are stored on a remote repository, just like packages in a
  typical Linux distribution
* Some typical commands:
```bash
# Install a gem
$ sudo gem install nokogiri
# To use it in your code, add:
# require 'nokogiri'

# Remove a gem
$ sudo gem remove nokogiri

# Get a list of all gems
$ gem list

# Search for a gem
$ gem query --details --remote --name-matches

# See where gems are stored
$ gem environment gemdir

# Get a web interface to see info about installed gems
$ gem server

# See all versions of a certain gem
$ gem list --details --remote --all mokogiri

# Install a specific version of a gem
$ gem install builder --version '< 1'nokogiri
# To use it in your code, add:
# gem 'nokogiri, '< 1', '> 0.0.1'
# require 'nokogiri'
```
* Making your own gems is done by writing a specification in a GemSpec
  file, named e.g. `my_program.gemspec` and containing the following:
```ruby
Gem::Specification.new do |s| 
  s.name         = "my_program"
  s.summary      = "Command-line tool to perform mathematical operation on complex numbers"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.requirements = [ 'none' ]
  s.version     = "0.1"
  s.author      = "Filip Dimovski"
  s.email       = "blah@lol.net"
  s.homepage    = "https://github.com/renderedtext/ruby-101"
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.9'
  s.files       = Dir['**/**']
  s.executables = [ 'complex' ]
  s.test_files  = Dir["test/test*.rb"]
  s.has_rdoc    = false
end
```
* The file must be located at the top-level directory of your project
* Afterwards, run this in the command line in the top-level directory:
  `gem build my_program.gemspec`
* You will get a file called `my_program-0.1.gem` - congratulations! :)
* Installing your gem: `sudo gem install my_program-0.1.gem`
* Removing your gem: `sudo gem remove my_program`
* Seeing info about your installed gem: `gem list my_program -d`


## Rake build tool
* *Rake* is a tool that automates building your program and preparing it
  for final production release, similar to the `make` tool
* Rake works by writing a description of the task to be done, and then
  writing the task in Ruby:
```ruby
desc "Remove files whose names end with a tilde"
task :delete_unix_backups do
  files = Dir['*~']
  rm(files, verbose: true) unless files.empty?
end

desc "Remove files with a .bak extension"
task :delete_windows_backups do
files = Dir['*.bak']
rm(files, verbose: true) unless files.empty?
end

desc "Remove Unix and Windows backup files"
task :delete_backups => [ :delete_unix_backups, :delete_windows_backups ] do
puts "All backups deleted"
end
```
* All these instructions are stored in a file called `Rakefile`
* The task names are symbols
* To execute a task, in the same directory where the Rakefile and your
  project are, type in the command line:
  `rakefile delete_unix_backups`
* You can compose tasks together in a group, where in `task` you write
  the name of a task as a symbol and key, and the value is an array of
  other tasks' names as symbols
* Since a Rakefile is Ruby code, you can define your own methods and use
  them throughout the tasks
* See all tasks that have a description using `rake -T` in command line



Unless otherwise noted, the texts and code are copyright © 2016 Rendered
Text and Filip Dimovski. All rights reserved. Released under the GNU
General Public License version 3 or greater. 
