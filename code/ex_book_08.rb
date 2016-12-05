#!/usr/bin/env ruby

# Example of matching regular expressions on strings

print "Tell me a name of a programming language: "
line = gets.downcase

if line =~ /perl|python|bash/
  puts "It's a scripting language."
elsif line =~ /ruby/
  puts "It's Ruby, a great scripting language! =]"
elsif line =~ /c|golang|c/
  puts "It's a compiled language."
elsif line =~ /java|erlang|elixir/
  puts "It's a bytecode compiled language executing on a virtual machine."
else
  puts "I don't know this language, maybe it's something new: #{line}"
end


# Substitution within a string using regular expressions
print "Tell me a sentence using the word Ruby once or more: "
line = gets

# Replace every occurence of Ruby or ruby with LOL
puts "You said: " + line.gsub(/[Rr]uby/, 'LOL')
