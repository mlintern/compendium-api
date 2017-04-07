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

# Category

result = admin.category.list(NetworkId: '758c2424-6055-4d3e-880c-4021718d814e')
puts "\nList of Categories\n"
puts JSON.pretty_generate(result)

result = admin.category.add('API Category', 'category')
puts "\nCreate Category\n"
puts JSON.pretty_generate(result)

new_id = result['Success']

result = admin.category.edit(new_id, Title: 'API Edited Title')
puts "\nEdit Category\n"
puts JSON.pretty_generate(result)

result = admin.category.delete(new_id)
puts "\nDelete Category\n"
puts JSON.pretty_generate(result)
