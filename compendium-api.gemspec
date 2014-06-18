# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'bundler/version'
 
Gem::Specification.new do |s|
  s.name        = "compendium-api"
  s.version     = Nretnil::ComepndiumAPI::VERSION
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
 
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md ROADMAP.md CHANGELOG.md)
  s.require_path = 'lib'
end