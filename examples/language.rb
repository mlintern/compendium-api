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

# Language

result = admin.language.list
puts "\nLanguage List\n"
puts JSON.pretty_generate(result)

result = admin.language.add("Test","TE")
puts "\nNew Language\n"
puts JSON.pretty_generate(result)

new_language_id = result["id"]

result = admin.language.edit(new_language_id, { :code => "TT" })
puts "\nEdit Language\n"
puts JSON.pretty_generate(result)

result = admin.language.delete(new_language_id)
puts "\nDelete Language\n"
puts JSON.pretty_generate(result)