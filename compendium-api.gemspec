# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'nretnil/compendium-api/version'

Gem::Specification.new do |s|
  s.name        = 'compendium-api'
  s.version     = Nretnil::CompendiumAPI::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Mark Lintern']
  s.email       = ['lintern.mark@gmail.com']
  s.homepage    = 'http://github.com/mlintern/compendium-api'
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.summary     = 'Ruby Helper for Compendium API'
  s.description = 'Set of simple functions to assist with making calls to the Compendium rest api.'
  s.license     = 'MIT'
  s.extra_rdoc_files = [
    'LICENSE',
    'README.md'
  ]

  s.post_install_message = "Know your target and what's behind it."

  s.required_rubygems_version = '>= 0.0.0'

  s.files         = Dir.glob('{bin,lib}/**/*') + %w[LICENSE README.md CHANGELOG.md]
  s.rdoc_options  = ['--charset=UTF-8']
  s.require_paths = ['lib']

  s.add_runtime_dependency('httparty', ['~> 0.10.0'])
end
