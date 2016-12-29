#!/usr/bin/env ruby

# File search methods using shell globbing or regular expressions

module FindUtility
  class Finder

    def initialize(opts)
      @opts = opts
    end

    def find(path, pattern)
      @opts[:regex] == true ? find_regex(path, pattern) : find_name(path, pattern)
    end

    def find_regex(path, pattern)
      # If recursive, glob directories using **/* to get all files
      # and then perform grep on the array
      asterisks = ''
      asterisks = '**/*' if @opts[:recursive] == true

      if @opts[:case_sensitive] == true
        files = Dir.glob(File.join(path, asterisks)).grep(Regexp.new(pattern)).sort.each { |x| puts x }
      else
        files = Dir.glob(File.join(path, asterisks)).grep(Regexp.new(pattern, Regexp::IGNORECASE)).sort.each { |x| puts x }
      end
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
