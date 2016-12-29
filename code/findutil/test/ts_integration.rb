#!/usr/bin/env ruby

# Hand-made integration test for the 'findutil' tool
# Using Test::Unit and Shoulda

require 'test/unit'
require 'shoulda'

$binary_path = "./bin/findutil"
Dir.chdir("../")

class TestShapes < Test::Unit::TestCase

  context "when no parameters given" do
    output = <<-END
/home/rex/work/ruby-101/code/findutil/bin
/home/rex/work/ruby-101/code/findutil/bin/findutil
/home/rex/work/ruby-101/code/findutil/findutil.gemspec
/home/rex/work/ruby-101/code/findutil/test
/home/rex/work/ruby-101/code/findutil/test/ts_integration.rb
/home/rex/work/ruby-101/code/findutil/lib
/home/rex/work/ruby-101/code/findutil/lib/finder.rb
/home/rex/work/ruby-101/code/findutil/lib/errormsg.rb
/home/rex/work/ruby-101/code/findutil/lib/runner.rb
/home/rex/work/ruby-101/code/findutil/README
END
    should "return all files and directories recursively" do
      assert_equal output, `#{$binary_path}`
    end
  end


  context "when lib/ directory given" do
    output = <<-END
lib/finder.rb
lib/errormsg.rb
lib/runner.rb
END
    should "return all files and directories from lib/ recursively" do
      assert_equal output, `#{$binary_path} lib/`
    end
  end


  context "when . directory given and -iname *.rb" do
    output = <<-END
./test/ts_integration.rb
./lib/finder.rb
./lib/errormsg.rb
./lib/runner.rb
END
    should "return all files with name *.rb from . recursively" do
      assert_equal output, `#{$binary_path} . -iname *.rb`
    end
  end


  context "when . directory given and -name *.RB" do
    output = ''
    should "return nothing" do
      assert_equal output, `#{$binary_path} . -name *.RB`
    end
  end


  context "when . directory given and -iregex \".*in.*\"" do
    output = <<-END
./bin
./bin/findutil
./findutil.gemspec
./lib/finder.rb
./test/ts_integration.rb
END
    should "return all files with name *.rb from . recursively" do
      assert_equal output, `#{$binary_path} . -iregex ".*in.*"`
    end
  end


  context "when . directory given and -regex \"R.*\"" do
    output = <<-END
./README
END
    should "return all files with name *.rb from . recursively" do
      assert_equal output, `#{$binary_path} . -regex "R.*"`
    end
  end

end
