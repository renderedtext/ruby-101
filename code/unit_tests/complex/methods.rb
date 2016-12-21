#!/usr/bin/env ruby


# Module of complex number operations

module ComplexNumberOperations
  # Addition that returns a new object
  def +(other)
    raise RuntimeError, "Parameter object must be of same class" unless other.class == self.class
    return ComplexNumber.new(@real + other.real, @imaginary + other.imaginary)
  end
  alias_method :add, :+

  # Addition that stores result in the calling object
  def add!(other)
    raise RuntimeError, "Parameter object must be of same class" unless other.class == self.class
    @real += other.real
    @imaginary += other.imaginary
    return self
  end


  # Subtraction that returns a new object
  def -(other)
    raise RuntimeError, "Parameter object must be of same class" unless other.class == self.class
    return ComplexNumber.new(@real - other.real, @imaginary - other.imaginary)
  end
  alias_method :subtract, :-

  # Addition that stores result in the calling object
  def subtract!(other)
    raise RuntimeError, "Parameter object must be of same class" unless other.class == self.class
    @real -= other.real
    @imaginary -= other.imaginary
    return self
  end


  # Multiplication that returns a new object
  def *(other)
    raise RuntimeError, "Parameter object must be of same class" unless other.class == self.class
    a, b, c, d = @real, @imaginary, other.real, other.imaginary
    r = (a * c) - (b * d)
    i = (b * c) + (a * d)
    return ComplexNumber.new(r, i)
  end
  alias_method :multiply, :*

  # Multiplication that stores result in the calling object
  def multiply!(other)
    raise RuntimeError, "Parameter object must be of same class" unless other.class == self.class
    a, b, c, d = @real, @imaginary, other.real, other.imaginary
    @real = (a * c) - (b * d)
    @imaginary = (b * c) + (a * d)
    return self
  end
end
