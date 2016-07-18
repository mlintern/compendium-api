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

# Language

result = admin.language.list
puts "\nLanguage List\n"
puts JSON.pretty_generate(result)

result = admin.language.add('Test', 'TE')
puts "\nNew Language\n"
puts JSON.pretty_generate(result)

new_language_id = result['id']

result = admin.language.edit(new_language_id, code: 'TT')
puts "\nEdit Language\n"
puts JSON.pretty_generate(result)

result = admin.language.delete(new_language_id)
puts "\nDelete Language\n"
puts JSON.pretty_generate(result)
