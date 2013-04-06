$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "precompiled_haml/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "precompiled_haml"
  s.version     = PrecompiledHaml::VERSION
  s.authors     = ["Mik-Die"]
  s.email       = ["MikDiet@gmail.com"]
  s.homepage    = 'https://github.com/Mik-die/precompiled_haml'
  s.summary     = "Precompile HAML on production to speed up view rendering."
  s.description = "Precompile HAML on production to speed up view rendering"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.0.0"
  s.add_dependency "haml", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
