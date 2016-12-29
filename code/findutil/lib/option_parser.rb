module FindUtility
  class Options

    def initialize(args)
      @args = args
    end

    def no_options?
      @args.length == 0
    end

    def path_defined?
      @args[0][0] == "-"
    end

    def path
      @args[0]
    end

    def recursive?
      result = true

      @args.each do |arg|
        if arg == "-r"
      end

      result
    end

    def regex_search?
      @args.find { |arg| arg == "-regex" || arg == "-iregex" } != nil
    end

    def name_search?
      @args.find { |arg| arg == "-name" || arg == "-iname" } != nil
    end

    def case_insensitive?
      @args.find { |arg| arg == "-iname" || arg == "-iregex" } != nil
    end

    def search_pattern
      @args.last
    end

    def name?
      @args.find { |arg| arg == "-name" } != nil
    end

    def case_insensitive_name?
      @args.find { |arg| arg == "-iname" } != nil
    end

    def non_recursive_search?
      has_options?(["-r", "-R", "--recursive"])
    end

    def recursive_search?
      has_options?(["-r", "-R", "--recursive"])
    end

    def show_version?
      has_options?(["--version"])
    end

    def show_tux?
      has_options?(["--tux"])
    end

    def show_help?
      has_options?(["--help"])
    end

    private

    def has_options?(options)
      options.count { |option| @args.include?(option) } > 0
    end

  end
end
