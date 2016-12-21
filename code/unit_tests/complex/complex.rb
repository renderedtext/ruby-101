#!/usr/bin/env ruby

require_relative 'methods.rb'

# Complex number class

class ComplexNumber

  # Include module with operations methods
  include ComplexNumberOperations

  # Initialization with .new(real, imaginary)
  def initialize(real, imaginary)
    @real = real.to_f
    @imaginary = imaginary.to_f
    to_s
  end

  # Display the complex number as string
  def to_s
    return "0.0" if @real == 0.0 and @imaginary == 0.0
    output = ""
    output << "#{@real}" unless @real == 0
    unless @imaginary == 0
      output << "+" if @imaginary > 0 and @real !=0
      output << "#{@imaginary}i"
    end
    output
  end

  # Pretty information display about the complex number
  def info
    "Real part: #{@real}\nImaginary part: #{@imaginary}i"
  end

  # Custom attribute readers and writers, because attr_accessor will not
  # convert given parameter to float, so I avoided it
  def real
    @real
  end

  def real=(real)
    @real = real.to_f
  end

  def imaginary
    @imaginary
  end

  def imaginary=(imaginary)
    @imaginary = imaginary.to_f
  end
end



