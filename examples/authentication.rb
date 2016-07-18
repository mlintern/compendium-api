# encoding: utf-8
# frozen_string_literal: true
require 'rubygems'
require 'bundler/setup'
require 'compendium-api'

# Authentication

user = '<username>'
key = '<api_key>'
admin = '<username>'
akey = '<api_key>'
server = 'https://app.test.compendium.com'

user = Nretnil::CompendiumAPI::Compendium.new(user, key, server)
admin = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)
public_user = Nretnil::CompendiumAPI::CompendiumPublic.new(server)
