require 'rubygems'
require 'bundler/setup'
require 'compendium-api'

#Authentication

admin = "<username>"
akey = "<api_key>"
server = "https://app.test.compendium.com"

admin = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)

# Custom Fields

result = admin.custom_field.list
puts "\nCustom Fields\n"
puts JSON.pretty_generate(result)

first_cf_id = result[0]["id"]

result = admin.custom_field.get(first_cf_id)
puts "\nFirst Custom Field\n"
puts JSON.pretty_generate(result)

result = admin.custom_field.add("API Custom Field","api-custom-field",{ :type => "predefined", :options => ["Red","White","Blue"] })
puts "\nCreate Custom Field\n"
puts JSON.pretty_generate(result)

last_cf_id=result["id"]

result = admin.custom_field.edit(last_cf_id,{ :visibility => "advanced", :field_id => Time.new.to_i, :type => "multi-predefined", :options => ["Red","White","Blue","Purple"] })
puts "\nEdit Custom Field\n"
puts JSON.pretty_generate(result)

result = admin.custom_field.delete(last_cf_id)
puts "\nDelete Custom Field\n"
puts JSON.pretty_generate(result)