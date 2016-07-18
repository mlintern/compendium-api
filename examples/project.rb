# encoding: utf-8
# frozen_string_literal: true
require 'rubygems'
require 'bundler/setup'
require 'compendium-api'

# Authentication

admin = '<username>'
akey = '<api_key>'
server = 'https://app.test.compendium.com'

admin = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)

# Projects

result = admin.project.list
puts "\nProject List\n"
puts JSON.pretty_generate(result)

first_project_id = result[0]['id']

result = admin.project.get(first_project_id)
puts "\nFirst Project\n"
puts JSON.pretty_generate(result)

result = admin.project.add('Test')
puts "\nNew Project\n"
puts JSON.pretty_generate(result)

new_project_id = result['id']

result = admin.project.edit(new_project_id, color: '#fff000')
puts "\nEdit Project\n"
puts JSON.pretty_generate(result)

result = admin.project.delete(new_project_id)
puts "\nDelete Project\n"
puts JSON.pretty_generate(result)
