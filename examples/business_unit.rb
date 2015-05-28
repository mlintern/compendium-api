require 'rubygems'
require 'bundler/setup'
require 'compendium-api'

#Authentication

user = "<username>"
key = "<api_key>"
admin = "<username>"
akey = "<api_key>"
server = "https://app.test.compendium.com"

user = Nretnil::CompendiumAPI::Compendium.new(user, key, server)
admin = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)
public_user = Nretnil::CompendiumAPI::CompendiumPublic.new(server)

# Business Units

result = admin.bu.list
puts "\nBU List\n"
puts JSON.pretty_generate(result)

puts admin.helper.pub_ids

result = admin.bu.add("Test",admin.helper.pub_ids)
puts "\nNew BU\n"
puts JSON.pretty_generate(result)

new_bu_id = result["business_unit_id"]

result = admin.bu.edit(new_bu_id, { :name => "Updated Name" })
puts "\nEdit BU\n"
puts JSON.pretty_generate(result)