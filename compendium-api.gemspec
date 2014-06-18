# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'bundler/version'
 
Gem::Specification.new do |s|
  s.name        = "bundler"
  s.version     = Bundler::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mark Lintern"]
  s.email       = ["lintern.mark@gmail.com"]
  s.homepage    = "http://github.com/mlintern/compendium-api"
  s.summary     = "Ruby Helper for Compendium API"
  s.description = "Helper Class for Using Compendium API"
 
  s.required_rubygems_version = ">= 0.0.0"
  s.rubyforge_project         = "bundler"
 
  s.add_development_dependency "rspec"
 
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md ROADMAP.md CHANGELOG.md)
  s.executables  = ['bundle']
  s.require_path = 'lib'
end