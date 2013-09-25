$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "propensity/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "propensity"
  s.version     = Propensity::VERSION
  s.authors     = ["Nicholas W. Watson"]
  s.email       = ["nick@entropi.co"]
  s.homepage    = "http://github.com/entropillc/propensity"
  s.summary     = "Configuration/Setttings for Rails applications"
  s.description = "Configuration/Setttings for Rails applications"

  s.files = Dir["{app,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.0"

end
