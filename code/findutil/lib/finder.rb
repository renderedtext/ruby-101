#!/usr/bin/env ruby


module FindUtility
  class Finder

    def initialize(opts)
      @matches = []
      @opts = opts
    end

    def find(path, pattern)
      if @opts[:regex]
        find_regex(path, pattern)
      else
        find_name(path, pattern)
      end
    end

    def find_regex(path, pattern)
    end

    def find_name(path, pattern)
      # If recursive, glob directories using **
      asterisks = ''
      asterisks = '**' if @opts[:recursive] == true

      if @opts[:case_sensitive] == true
        files = Dir.glob(File.join(path, asterisks, pattern)).each { |x| puts x }
      else
        files = Dir.glob(File.join(path, asterisks, pattern), File::FNM_CASEFOLD).each { |x| puts x }
      end
    end

  end
end
