# encoding: utf-8
# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'compendium-api'

# Authentication

user = '<username>'
akey = '<api_key>'
server = 'https://app.test.compendium.com'

admin = Nretnil::CompendiumAPI::Compendium.new(user, akey, server)

# Content Types

result = admin.content_type.list
puts "\nContent Types\n"
puts JSON.pretty_generate(result)

first_content_type_id = result[0]['id']

result = admin.content_type.get(first_content_type_id)
puts "\nFirst Content Type\n"
puts JSON.pretty_generate(result)

name = 'API Content Type'
config = { related_content: false }
options = { icon: 'fa-cloud-upload', primary_editor: 'image' }

result = admin.content_type.add(name, config, options)
puts "\nNew Content Type\n"
puts JSON.pretty_generate(result)

new_content_type_id = result['id']

config = { content_score: false, related_content: true }

result = admin.content_type.edit(new_content_type_id, config, {})
puts "\nEdit Content Type\n"
puts JSON.pretty_generate(result)

result = admin.content_type.delete(new_content_type_id)
puts "\nDelete Content Type\n"
puts JSON.pretty_generate(result)
