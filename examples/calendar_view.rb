# encoding: utf-8
# frozen_string_literal: true
require 'rubygems'
require 'bundler/setup'
require 'compendium-api'

# Authentication

admin = '<username>'
akey = '<api_key>'
server = 'https://app.test.compendium.com'

session = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)

# Calendar Views

views = session.calendar_view.list

puts views.length

first_view_id = views[0]['id']

puts session.calendar_view.get(first_view_id)

filter = {
  social: %w(facebook twitter linkedin)
}

puts new_view = session.calendar_view.add('Show Social', filter_state: filter)

puts session.calendar_view.edit(new_view['id'], name: "Social View One")

puts session.calendar_view.assigned

puts session.calendar_view.delete(new_view['id'])
