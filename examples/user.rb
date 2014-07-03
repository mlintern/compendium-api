require 'rubygems'
require 'bundler/setup'
require 'compendium-api'
require 'json'

#Authentication

admin = "<username>"
akey = "<api_key>"
server = "https://app.test.compendium.com"

admin = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)

#User

result = admin.user.get
puts "\nSelf\n"
puts JSON.pretty_generate(result)

result = admin.user.list
puts "\nList of Users\n"

result.each do |user|
	puts "username: #{user['username']} roles: #{user['roles'].to_s}"
end

first_user_id = result[0]["user_id"]

result = admin.user.get(first_user_id)
puts "\nSingle User\n"
puts JSON.pretty_generate(result)

username = "apicreated"
firstname = "Test Api"
lastname = "User"
email = "tuser@gmail.com"

result = admin.user.add(username,firstname,lastname,email)
puts "\nAdd User\n"
puts JSON.pretty_generate(result)

new_user_id = result["Success"]["UserId"]

result = admin.user.edit(new_user_id, {:UserName => Time.new.to_i, :FirstName => "Johnathon", :EmailAddress => "jsmith@live.com" })
puts "\nEdit User\n"
puts JSON.pretty_generate(result)