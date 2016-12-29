#!/usr/bin/env ruby

# Command line swtiches parser

require_relative '../lib/finder.rb'
require_relative '../lib/errormsg.rb'


module FindUtility
  class Runner
    Version = 0.1

    def initialize(args)
      @args = args

      @prog_name = File.basename($0, File.extname($0))
    end

    def run
      options = FindUtility::Options.new(@args)

      if options.no_options?
        FindUtility::Finder.new(configuration).find(Dir.pwd, "**/*")
        return
      end

      if options.show_version?
        show_version
        return
      end

      if options.show_tux?
        show_tux
        return
      end

      if options.show_help?
        show_usage
        return
      end

      path = options.path_defined? ? options.path : Dir.pwd

      if options.regex_search?
        FindUtility::RegexFinder.new(options.case_insensitive?, options.recursive?, path, options.search_pattern)
        return
      end

      if options.name_search?
        FindUtility::NameFinder.new(options.case_insensitive?, path, options.search_pattern)
        return
      end
    end


  end
end
