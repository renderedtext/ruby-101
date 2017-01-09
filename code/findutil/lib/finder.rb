#!/usr/bin/env ruby

# File search methods using shell globbing, regular expressions

module FindUtility
  class Find
    def initialize(path, pattern, case_sensitive, recursive)
      @path, @pattern = path, pattern
      @flags =  if case_sensitive
                  File::FNM_DOTMATCH
                else
                  File::FNM_CASEFOLD | File::FNM_DOTMATCH
                end

      @globs =  if recursive
                  '**'
                else
                  ''
                end
    end

    def find_regexp
      #~ puts "Debug regexp:\npath:#{@path},\npattern:#{@pattern},\nflags:#{@flags},\nglobs:#{@globs}"
      Dir.glob(File.join(@path, @globs, "*"), @flags)
        .grep(Regexp.new(@pattern))
        .sort
        .each { |x| puts x }
    end

    def find_name
      #~ puts "Debug name:\npath:#{@path},\npattern:#{@pattern},\nflags:#{@flags},\nglobs:#{@globs}"
      Dir.glob(File.join(@path, @globs, @pattern), @flags)
        .sort
        .each { |x| puts x }
    end
  end
end
