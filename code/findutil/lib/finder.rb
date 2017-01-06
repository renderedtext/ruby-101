#!/usr/bin/env ruby

# File search methods using shell globbing, regular expressions

module FindUtility
  class FindRegexp
    def initialize(path, pattern, case_sensitive, recursive)
      @path, @pattern = path, pattern
      @flags = ! case_sensitive ?
        (Regexp::IGNORECASE | File::FNM_DOTMATCH) : File::FNM_DOTMATCH
      @glob = recursive ? '**/*' : ''
    end

    def find
      Dir.glob(File.join(@path, @glob), @flags)
        .grep(Regexp.new(@pattern))
        .sort
        .each { |x| puts x }
    end
  end

  class FindName
    def initialize(path, name, case_sensitive, recursive)
      @path, @name = path, name
      @flags = ! case_sensitive ?
        (Regexp::IGNORECASE | File::FNM_DOTMATCH) : File::FNM_DOTMATCH
      @glob = recursive ? '**' : ''
    end

    def find
      Dir.glob(File.join(@path, @glob, @name), @flags)
        .sort
        .each { |x| puts x }
    end
  end
end
