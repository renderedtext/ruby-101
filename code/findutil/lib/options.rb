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
      @args[1]
    end

    def recursive?
      has_options?(["-r", "-R", "--recursive"])
    end

    def case_sensitive?
      has_options?(["-c", "--case"])
    end

    def regex_search?
      has_options?(["--regex"])
    end

    private

    def has_options?(options)
      options.count { |option| @args.include?(option) } > 0
    end

  end
end
