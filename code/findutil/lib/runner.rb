#!/usr/bin/env ruby

# Main part of the program

require_relative '../lib/finder.rb'
require_relative '../lib/options.rb'


module FindUtility
  class Runner

    Version = 0.2

    def initialize(args)
      @args = args
      @prog_name = File.basename($0, File.extname($0))
    end

    def run
      opts = FindUtility::Options.new(@args)

      # If no command line arguments provided,
      # show all files in current directory and exit
      if opts.no_options?
        FindUtility::FindName.new(Dir.pwd, "**", false, false).find
        return
      end

      if opts.show_usage?
        show_usage
        return
      end

      if opts.path_defined?
        path = opts.path
        pattern = opts.search_pattern
      else
        path = Dir.pwd
        pattern = opts.path
      end

      if opts.regex_search?
        FindUtility::FindRegexp
          .new(path, pattern, opts.case_sensitive?, opts.recursive?)
          .find
      else
        FindUtility::FindName
          .new(path, pattern, opts.case_sensitive?, opts.recursive?)
          .find
      end
    end

    def show_usage
      puts <<-HELP
File finder utility, version #{Version}
Copyright (c) 2016 Filip Dimovski. Licensed under GPLv3+.

Usage: #{@prog_name} [path] [name] [parameter(s)]...

Parameters:
  --help, -h
      Show this help message

  --recursive, -r, -R
      Search continues inside subdirectories as well

  --case, -c
      Search will be case-sensitive, don't ignore case

  --regex
      Search for a file name using a regular expression

Hints:
Search is not recursive by default, it doesn't search in subdirectories.
Searches are not case sensitive by default, so 'A' is same as 'a'. 
If no parameters are provided, it will show files in current directory.
HELP
    end

    def show_not_exist(file)
      puts "Directory does not exist: #{file}"
    end

    def show_no_name
      puts "No name or regular expression provided."
    end

  end
end
