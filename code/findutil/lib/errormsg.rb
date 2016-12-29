#!/usr/bin/env ruby

# Error and info messages

module FindUtility
  class Runner

    def show_usage
      puts <<-HELP
Utility for finding files and folders
Copyright (c) 2016 Filip Dimovski. Licensed under GPLv3+.

Usage: #{@prog_name} [path] [parameter(s)]...
HELP
      exit 0
    end

    def show_version
      puts <<-USAGE
File finder utility #{Version}
Copyright (C) 2016 Filip Dimovski
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
USAGE
      exit 0
    end

    def show_file_does_not_exist(file)
      puts "#{@prog_name}: ‘#{file}’: No such file or directory"
      exit 0
    end

    def show_missing_arg(arg)
      puts "#{@prog_name}: missing argument to `#{arg}'"
      exit 1
    end

    def show_wrong_predicate(pred)
      puts "#{@prog_name}: unknown predicate `#{pred}'"
      exit 1
    end

  end
end
