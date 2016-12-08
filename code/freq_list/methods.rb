#!/usr/bin/env ruby
#
#  logic.rb
#
# Example of using arrays and hashes to create word-frequency lists
# This Ruby file contains the methods
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


# Splits a string into separate words
# Returns an array containing the words
def get_words(string)
  string.downcase.scan(/[\w']+/)
end

# Counts the frequency of words in an array
# Returns a hash, key: word, value: number of times it appears
def count_freq(words)
  # Provide a default value of 0 for words that
  # are inserted for the first time, to avoid bugs
  counts = Hash.new(0)

  for word in words
    # For each time a word appears, increase its counter by 1
    counts[word] += 1
  end

  counts
end
