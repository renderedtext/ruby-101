#!/usr/bin/env ruby

# Example class used to demonstrate unit tests

class Sugar
  def initialize(sweet)
    @sweet = sweet.to_s
  end

  def to_s
    @sweet
  end
end
