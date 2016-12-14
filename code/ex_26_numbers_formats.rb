#!/usr/bin/env ruby

# Example of number classes and formats

num = 2468

5.times do
  puts "Class: #{num.class}; Number: #{num}"
  num *= num
end

num = 2468
# Print the number in several notations
print "\nThe integer #{num} in several notations:\n"
printf("Binary        (base 2)      0b%b\n", num)
printf("Octal:        (base 8)      0%o\n", num)
printf("Decimal:      (base 10)     0d%d\n", num)
printf("Hexadecimal:  (base 16)     0x%x\n", num)
