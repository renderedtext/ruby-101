#!/usr/bin/env ruby
#
#  main.rb
#
# Example of using arrays and hashes to create word-frequency lists
# This Ruby file is the main program
#  
#  Copyright 2016 Filip Dimovski <rexich@riseup.net>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.

require_relative 'methods'

# This is the text we'll process
raw_text = %{Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
}


# Get the words in an array
word_list = get_words(raw_text)
# Count the number of times each word appears in the array
count_list = count_freq(word_list)
# Sort them by size, from least to most frequent
sorted_list = count_list.sort_by { |word, count| count }
# Choose the top 7 most frequent words (they appear last)
top_seven = sorted_list.last(7)

puts "Top seven words by frequency of appearance:"
top_seven.each do |word, count|
  puts "#{word}; #{count} times"
end
