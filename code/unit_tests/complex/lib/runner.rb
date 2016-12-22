#!/usr/bin/env ruby

module Rex
  class Runner
    def initialize(args)
      @args = args
    end

    def run
      p @args
    end
  end
end
