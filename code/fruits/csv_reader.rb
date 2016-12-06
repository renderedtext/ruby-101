#!/usr/bin/env ruby
#
#  csv_reader.rb
#  
#  Component that takes a CSV file and creates
#  an array of objects from all rows
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


# We need the CSV library to work wit CSV files
require 'csv'
# We will import our 'fruits' Ruby file from the same directory
require_relative 'fruits'


class CsvReader

  def initialize
    @fruits = []
  end

  def read_csv(csv_file)
    CSV.foreach(csv_file, headers: true) do |row|
      @fruits << Fruit.new(row["Kind"], row["Weight"], row["Price"])
    end
  end

  def total_value
    sum = 0.0
    @fruits.each { |fruit| sum += fruit.price }
    sum
  end
end
