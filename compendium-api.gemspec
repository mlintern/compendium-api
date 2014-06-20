$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'nretnil/compendium-api/version'
 
Gem::Specification.new do |s|
  s.name        = "compendium-api"
  s.version     = Nretnil::CompendiumAPI::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mark Lintern"]
  s.email       = ["lintern.mark@gmail.com"]
  s.homepage    = "http://github.com/mlintern/compendium-api"
  s.summary     = "Ruby Helper for Compendium API"
  s.description = "Helper Class for Using Compendium API"
  s.license = 'MIT'
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]

  s.required_rubygems_version = ">= 0.0.0"
 
  s.files         = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md CHANGELOG.md)
  s.require_paths = ['lib']

  s.add_runtime_dependency("httparty")
end