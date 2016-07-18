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

# Personas

result = admin.persona.list
puts "\nPersona List\n"
puts JSON.pretty_generate(result)

first_persona_id = result[0]['id']

result = admin.persona.get(first_persona_id)
puts "\nFirst Persona\n"
puts JSON.pretty_generate(result)

result = admin.persona.add('Test Persona')
puts "\nNew Persona\n"
puts JSON.pretty_generate(result)

new_persona_id = result['id']

result = admin.persona.edit(new_persona_id, name: 'New Name')
puts "\nEdit Persona\n"
puts JSON.pretty_generate(result)

result = admin.persona.delete(new_persona_id)
puts "\nDelete Persona\n"
puts JSON.pretty_generate(result)
