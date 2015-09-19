$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "farm_shed/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "farm_shed"
  s.version     = FarmShed::VERSION
  s.authors     = ["Jesse Farmer"]
  s.email       = ["jessethebuilder@yahoo.com"]
  s.homepage    = "http://anysoft.us"
  s.summary     = "Stuff Jesse Farmer uses"
  s.description = "Tools and hacks. Free. "
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.4"
  
  s.add_dependency "geocoder", "~> 1.2.9" 

  s.add_development_dependency "sqlite3"
  
  s.test_files = Dir["spec/**/*"]
end
