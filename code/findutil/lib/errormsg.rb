#!/usr/bin/env ruby

# Error and info messages

module FindUtility
  class Runner
    def show_usage
      puts <<-HELP
File finder utility, version #{Version}
Copyright (c) 2016 Filip Dimovski. Licensed under GPLv3+.

Usage: #{@prog_name} [path] [parameter(s)]...

Parameters:
  --version
      Shows the version of this program
  --help
      Show this help text
  -r, -R, --recursive
      Search continues within subdirectories as well (default)
  -nr, --no-recursive
      Search happens only within current directory, do not recurse
  -iregex REGEXP
      Search for a file name using regular expression, case-insensitive
  -regex REGEXP
      Search for a file name using regular expression, case-sensitive
  -iname NAME
      Search for a file name using shell globs, case-insensitive
  -name NAME
      Search for a file name using shell globs, case-sensitive
  --tux
      Gives a blessing from our favorite Linux penguin :)
HELP
      exit 0
    end

    def show_version
      puts <<-USAGE
File finder utility, version #{Version}
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

    def show_tux
      puts <<-TUX
     .--.
    |o_o |
    |:_/ |
   //   \\ \\
  (|     | )
 /\'\\_   _/`\\
 \\___)=(___/
  Linux <3
TUX
      exit 0
    end
  end
end
