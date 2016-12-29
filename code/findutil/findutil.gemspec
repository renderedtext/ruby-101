Gem::Specification.new do |s|
  s.name         = "findutil"
  s.summary      = "Command-line tool to search for files throughout the file system"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.requirements = [ 'none' ]
  s.version     = "0.1"
  s.author      = "Filip Dimovski"
  s.email       = "rexich@riseup.net"
  s.homepage    = "https://github.com/renderedtext/ruby-101"
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.9'
  s.files       = Dir['**/**']
  s.executables = [ 'findutil' ]
  s.test_files  = Dir["test/ts*.rb"]
  s.has_rdoc    = false
  s.license     = "GPL-3.0"
end
