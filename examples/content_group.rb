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

# Content Groups

result = admin.content_group.list
puts "\nList of Groups\n"
puts JSON.pretty_generate(result)

first_group_id = result[0]["id"]

result = admin.content_group.get(first_group_id)
puts "\nFirst Group\n"
puts JSON.pretty_generate(result)

result = user.content_group.add("API Group")
puts "\nNew Group\n"
puts JSON.pretty_generate(result)

new_group = result["id"]

result = user.content.list({ :Status => ["approved"].to_json})

posts = result['posts']

items = []
items << posts[0]["id"]
items << posts[1]["id"]
items << posts[2]["id"]
items << posts[3]["id"]

result = user.content_group.add_item(new_group,items)
puts "\nNew Items to Group\n"
puts JSON.pretty_generate(result)

result = user.content_group.get(new_group)
puts "\nGet Group\n"
puts JSON.pretty_generate(result)

config = result["config"]
config["character_limit"] = '400'

result = user.content_group.edit(new_group, config)
puts "\nEdit Group\n"
puts JSON.pretty_generate(result)

result = admin.content_group.get(new_group)
items = result["items"]
item_config = items[1]["config"]
item_id = items[1]["post_id"]
item_config["layout"] = "right_thumbnail"

result = admin.content_group.edit_item(new_group, item_id, item_config)
puts "\nEdit Group Item\n"
puts JSON.pretty_generate(result)

result = admin.content_group.delete(new_group)
puts "\nDelete Group\n"
puts JSON.pretty_generate(result)