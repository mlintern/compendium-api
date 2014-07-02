require 'rubygems'
require 'bundler/setup'
require 'compendium-api'
require 'json'

#Authentication

user = "<username>"
key = "<api_key>"
admin = "<username>"
akey = "<api_key>"
server = "https://app.test.compendium.com"

user = Nretnil::CompendiumAPI::Compendium.new(user, key, server)
admin = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)

#Publishers

result = user.publisher.list
puts JSON.pretty_generate(result)

publishers = result

puts publishers.count

publishers.each do |pub|
	if pub["default"] == "true"
		puts "Default Publisher: #{pub['publisher_name']}"
	end
end

first_pub_id = publishers[0]["id"]

result = admin.publisher.get(first_pub_id)
puts JSON.pretty_generate(result)