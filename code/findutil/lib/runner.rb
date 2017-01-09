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

      if opts.no_options?
        FindUtility::Find.new(Dir.pwd, "**", false, false).find_name
        return
      end

      if opts.show_usage?
        opts.show_usage
        return
      end

      path =  if opts.path_defined?
                opts.path
              else
                Dir.pwd
              end

      if opts.regexp_search?
        FindUtility::Find
          .new(path, opts.search_pattern, opts.case_sensitive?, opts.recursive?)
          .find_regexp
      else
        FindUtility::Find
          .new(path, opts.search_pattern, opts.case_sensitive?, opts.recursive?)
          .find_name
      end
    end
  end
end
