#!/usr/bin/env ruby

require_relative '../lib/finder.rb'
require_relative '../lib/errormsg.rb'


module FindUtility
  class Runner
    Version = 0.1

    def initialize(args)
      @args = args
      # Hash containing options modified through switches from cmdline
      # If no starting directory given, current directory is assumed
      @opts = { starting_point: Dir.pwd,
                search_term: "**",
                regex: false,
                recursive: true,
                case_sensitive: true
              }
      @prog_name = File.basename($0, File.extname($0))
    end

    def run
      # If no arguments are given, skip switch processing
      if @args.length == 0
        FindUtility::Finder.new(@opts).find(Dir.pwd, "**/*")
        exit 0
      end

      # Define flags that modify the parser loop's execution
      flag_get_search_term = false
      flag_first_loop = true
      flag_nonexistent_dir = false
      current_switch = ''


      # Parser loop - ends when list of arguments is exhausted
      loop do
        # Get the argument to process
        arg = @args.shift

        # If it's first loop, search for a starting directory
        if flag_first_loop == true
          # Check whether we got a directory, and if it exists
          if File.exist?(arg)
            if File.directory?(arg)
              @opts[:starting_point] = arg.dup
            else
              @opts[:search_term] = arg.dup
              @opts[:starting_point] = File.absolute_path(arg)
            end
            # Found the starting directory, get next switch to process
            flag_first_loop = false
            next
          else
            # Is it a switch? Then starting point is current working directory
            # If no arguments are provided, also assume current working directory
            # as a starting point for the search - it will break out of the loop
            # after this
            if arg[0,1] == '-'
              @opts[:starting_point] = Dir.pwd
            else
              @opts[:starting_point] = arg.dup
              flag_nonexistent_dir = true
            end
          end
          flag_first_loop = false
        end

        # If you provided a comand that requires an argument, get it now
        if flag_get_search_term == true
          # Show error if missing search term and quit program
          show_missing_arg(current_switch) if arg == nil
          @opts[:search_term] = arg.dup
          flag_get_search_term = false
          next
        end

        # Match the argument with the appropriate switch
        case arg
        when '-v', '--verbose'
          @opts[:verbose] = true
          next
        when '--version'
          show_version
        when '--help'
          show_usage
        when '-R', '-r', '--recursive'
          @opts[:recursive] = true
          next
        when '-nr', '--no-recursive'
          @opts[:recursive] = false
          next
        when '-regex'
          @opts[:regex] = true
          @opts[:case_sensitive] = true
          flag_get_search_term = true
          current_switch = arg.dup
          next
        when '-iname'
          @opts[:case_sensitive] = false
          flag_get_search_term = true
          current_switch = arg.dup
          next
        when '-name'
          @opts[:case_sensitive] = true
          flag_get_search_term = true
          current_switch = arg.dup
          next
        when nil
          # Break out of the loop if no more switches are left
          break
        else
          show_wrong_predicate(arg)
        end
      end

      # Now, if wrong directory given, show error message and exit
      # Why did we have to wait for all of the switches to be processed?
      # Because I am emulating GNU find's behavior, where priority is
      # given on processing the switches and showing error messages for
      # their missing arguments. :)
      show_file_does_not_exist(@opts[:starting_point]) if flag_nonexistent_dir == true

      finder = FindUtility::Finder.new(@opts)
      finder.find(@opts[:starting_point], @opts[:search_term])
      exit 0
    end
  end
end



#
