#!/usr/bin/env ruby
#
#  main.rb
#  
#  Main program, parses CSV file(s), gets total sum and prints it
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

# We need our main code for partsing CSV files and making array of them
require_relative 'csv_reader'

reader = CsvReader.new

# Get all file names from command line arguments and parse CSV
ARGV.each do |filename|
  # Send diagnostic message to stderr
  STDERR.puts "Processing #{filename}..."
  reader.read_csv(filename)
end

puts "Total value of all fruits: #{reader.total_value}."
