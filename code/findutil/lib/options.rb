#!/usr/bin/env ruby

# Parsing of command line switches

module FindUtility
  class Options

    def initialize(args)
      @args = args
    end

    def no_options?
      @args.length == 0
    end

    def show_usage?
      has_options?(["--help", "-h"])
    end

    def path_defined?
      File.directory?(@args[0])
    end

    def path
      @args[0]
    end

    def search_pattern
      pattern = @args.reject { |x| x[0] == '-' }
      if path_defined?
        if pattern.last == path
          regexp_search? ? ".*" : "*"
        else
          pattern.last
        end
      else
        if pattern.last == nil
          regexp_search? ? ".*" : "*"
        else
          pattern.last
        end
      end
    end

    def recursive?
      has_options?(["-r", "-R", "--recursive"])
    end

    def case_sensitive?
      has_options?(["-c", "--case"])
    end

    def regexp_search?
      has_options?(["-x", "--regexp"])
    end

    def show_usage
      puts <<-HELP
File finder utility, version #{FindUtility::Runner::Version}
Copyright (c) 2016 Filip Dimovski. Licensed under GPLv3+.

Usage: #{@prog_name} [path] [name/regexp] [parameter(s)]...

Parameters:
  --help, -h
      Show this help message

  --recursive, -r, -R
      Search continues inside subdirectories as well

  --case, -c
      Search will be case-sensitive, don't ignore case

  --regexp, -x
      Search for a file name using a regular expression

Hints:
If path is missing, it will search in the current working directory.
If name/regexp is missing, it will search for all file names.
If no parameters are provided, it will show files in current directory.
Search is not recursive by default, it doesn't search in subdirectories.
Searches are not case sensitive by default, so 'A' is same as 'a'. 
HELP
    end

    private

    def has_options?(options)
      options.count { |option| @args.include?(option) } > 0
    end
  end
end
