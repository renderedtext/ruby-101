Gem::Specification.new do |s|
  s.name         = "shapes"
  s.summary      = "Command-line tool to find area or perimeter of a geometrical shape"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.requirements = [ 'none' ]
  s.version     = "0.1"
  s.author      = "Filip Dimovski"
  s.email       = "rexich@riseup.net"
  s.homepage    = "https://github.com/renderedtext/ruby-101"
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.9'
  s.files       = Dir['**/**']
  s.executables = [ 'complex' ]
  s.test_files  = Dir["test/test*.rb"]
  s.has_rdoc    = false
  s.license     = "GPL3"
end
