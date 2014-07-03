require 'rubygems'
require 'bundler/setup'
require 'compendium-api'
require 'json'

#Authentication

admin = "<username>"
akey = "<api_key>"
server = "https://app.test.compendium.com"

admin = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)

# Roles

result = admin.role.list
puts "\nList of Roles\n"
puts JSON.pretty_generate(result)

result = admin.role.add("API Role",[{:id => "categories.manage.network"},{:id => "campaigns.manage.network"},{:id => "assignments.manage.network"},{:id => "topics.manage.network"},{:id => "content_types.manage.network"},{:id => "design.manage.network"},{:id => "redirects.manage.network"},{:id => "content.promote.network"},{:id => "contentbuckets.manage.self"},{:id => "analytics.read.self"}])
puts "\nNew Role\n"
puts JSON.pretty_generate(result)

new_role_id = result["id"]

result = admin.role.edit( new_role_id, { :name => "Updated API Role" , :permissions => [{:id => "assignments.manage.network"},{:id => "topics.manage.network"},{:id => "content_types.manage.network"},{:id => "design.manage.network"},{:id => "redirects.manage.network"},{:id => "content.promote.network"},{:id => "contentbuckets.manage.self"}]} )
puts "\nEdit Role\n"
puts JSON.pretty_generate(result)

result = admin.user.list
first_user_id = result["Success"][0]["UserId"]
result = admin.user.get(first_user_id)
puts result
user_roles = result["Success"]["Roles"]
roles = [new_role_id]

user_roles.each do |r|
	roles.push(r["Id"])
end

result = admin.role.assign(first_user_id,roles.uniq)
puts "\nAssign Roles\n"
puts JSON.pretty_generate(result)

result = admin.role.delete(new_role_id)
puts "\nDelete Role\n"
puts JSON.pretty_generate(result)