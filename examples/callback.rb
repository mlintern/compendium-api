require 'rubygems'
require 'bundler/setup'
require 'compendium-api'

#Authentication

root = "<username>"
rkey = "<api_key>"
server = "https://app.test.compendium.com"

root = Nretnil::CompendiumAPI::Compendium.new(user, rkey, server)

#Callback

result = root.callback.fire("Social.Message.Send", { :foo => "bar" } )
puts "\nCallback\n"
puts JSON.pretty_generate(result)