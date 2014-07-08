require 'rubygems'
require 'bundler/setup'
require 'compendium-api'
require 'json'

#Authentication

user = "<username>"
akey = "<api_key>"
server = "https://app.test.compendium.com"

user = Nretnil::CompendiumAPI::Compendium.new(user, akey, server)

#Callback

result = user.calendar.add("Social.Message.Send", { :foo => "bar" } )
puts "\nCallback\n"
puts JSON.pretty_generate(result)