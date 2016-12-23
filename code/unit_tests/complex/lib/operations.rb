#!/usr/bin/env ruby


# Module of complex number operations

module Rex
  module ComplexOperations

    # Addition that returns a new object
    def +(other)
      raise RuntimeError, "Parameter object must be of same class" unless other.class == self.class
      return Rex::ComplexNumber.new(@real + other.real, @imaginary + other.imaginary)
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
      return Rex::ComplexNumber.new(@real - other.real, @imaginary - other.imaginary)
    end
    alias_method :sub, :-

    # Addition that stores result in the calling object
    def sub!(other)
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
      return Rex::ComplexNumber.new(r, i)
    end
    alias_method :mul, :*

    # Multiplication that stores result in the calling object
    def mul!(other)
      raise RuntimeError, "Parameter object must be of same class" unless other.class == self.class
      a, b, c, d = @real, @imaginary, other.real, other.imaginary
      @real = (a * c) - (b * d)
      @imaginary = (b * c) + (a * d)
      return self
    end


    # Division that returns a new object
    def /(other)
      raise RuntimeError, "Parameter object must be of same class" unless other.class == self.class
      a, b, c, d = @real, @imaginary, other.real, other.imaginary
      r = ((a * c) + (b * d)) / ((c * c) + (d * d))
      i = ((b * c) - (a * d)) / ((c * c) + (d * d))
      return Rex::ComplexNumber.new(r, i)
    end
    alias_method :div, :/

    # Division that stores result in the calling object
    def div!(other)
      raise RuntimeError, "Parameter object must be of same class" unless other.class == self.class
      a, b, c, d = @real, @imaginary, other.real, other.imaginary
      @real = ((a * c) + (b * d)) / ((c * c) + (d * d))
      @imaginary = ((b * c) - (a * d)) / ((c * c) + (d * d))
      return self
    end


    # Conjugate the complex number (imaginary part reflects on the x-axis)
    def conj
      return Rex::ComplexNumber.new(@real, -@imaginary)
    end

    # Conjugate, but modify the calling object
    def conj!
      @imaginary = -@imaginary
      return self
    end


    # Reciprocal of a complex number
    def recp
      a = @real
      b = @imaginary
      m = ((a * a) + (b * b))
      r = a / m
      i = b / m
      return Rex::ComplexNumber.new(r, i)
    end

    # Reciprocal, but modify the calling object
    def recp!
      a = @real
      b = @imaginary
      m = ((a * a) + (b * b))
      @real = a / m
      @imaginary = b / m
      return self
    end


    # Positive square root or a complex number
    def sqrt
      if @imaginary == 0.0
        if @real < 0.0
          return Rex::ComplexNumber.new(0.0, Math.sqrt(-@real))
        else
          return Rex::ComplexNumber.new(Math.sqrt(@real), 0.0)
        end
      else
        if @imaginary < 0.0
          return self.conj.sqrt.conj
        else
          a = @real
          b = @imaginary
          r = Math.sqrt(((a * a) + (b * b)))  # Absolute value
          gamma = Math.sqrt((r + a) / 2.0)
          delta = Math.sqrt((r - a) / 2.0)
          return Rex::ComplexNumber.new(gamma, delta)
        end
      end
    end

  end
end
