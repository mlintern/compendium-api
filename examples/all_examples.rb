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


#Calendar

start_date = Time.now.utc
end_date = (start_date + (7*24*60*60)).iso8601

result = admin.calendar.add("Now", start_date.iso8601, { :color => "#abc123", :description => "api calendar event", :icon => "fa-clock-o" } )
puts "\nNew Calendar Event\n"
puts JSON.pretty_generate(result)

result = admin.calendar.add("Next 7 Days", start_date.iso8601, { :all_day => true, :end_date => end_date, :color => "#123abc", :description => "api calendar event range", :icon => "fa-clock-o" } )
puts "\nNew Calendar Event Span\n"
puts JSON.pretty_generate(result)

new_event_id = result["id"]

result = admin.calendar.events( (start_date - (4*7*24*60*60)).iso8601, end_date )
puts "\nCalendar Events\n"
puts JSON.pretty_generate(result)

spans = result["spans"]
events = result["events"]

puts events.length

events.each do |event|
	JSON.pretty_generate(event)
end

result = admin.calendar.delete(new_event_id)
puts "\nDelete Event\n"
puts JSON.pretty_generate(result)


#Category

result = admin.category.list({ :NetworkId => "758c2424-6055-4d3e-880c-4021718d814e" })
puts "\nList of Categories\n"
puts JSON.pretty_generate(result)

result = admin.category.add("API Category","category")
puts "\nCreate Category\n"
puts JSON.pretty_generate(result)

new_id = result["Success"]

token = user.helper.slugify("API Edited Title")
result = admin.category.edit(new_id, { :Title => "API Edited Title" })
puts "\nEdit Category\n"
puts JSON.pretty_generate(result)

result = admin.category.delete(new_id)
puts "\nDelete Category\n"
puts JSON.pretty_generate(result)


#Comment

result = user.comment.list({})
puts "\nList of Comments\n"
puts JSON.pretty_generate(result)

comments = result["Success"]

first_comment_id = comments[0]["CommentId"]

result = admin.comment.get(first_comment_id)
puts "\nFirst Comment\n"
puts JSON.pretty_generate(result)

post_id = "d9a0ad5c-6f81-454e-a751-55bd47af05e4"
body = "Comment Text"
time = Time.new.iso8601
name = "John Smith"
email = "jsmith@gmail.com"

result = user.comment.add(post_id, body, time, name, email)
puts "\nCreate Comment\n"
puts JSON.pretty_generate(result)

new_comment_id = result["Success"]

result = admin.comment.approve([new_comment_id])
puts "\nApprove Comment\n"
puts JSON.pretty_generate(result)

result = admin.comment.decline([new_comment_id])
puts "\nDecline Comment\n"
puts JSON.pretty_generate(result)


#Content

publisher_id = "da091c4e-0556-4d2b-841b-24c8afc3be95"

result = public_user.content.list(publisher_id)
puts "\nPublic List of Posts\n"
puts JSON.pretty_generate(result)

pub_post_id = result[0]["id"]

result = public_user.content.get(publisher_id,pub_post_id)
puts "\nPublic Piece of Content\n"
puts JSON.pretty_generate(result)

result = user.content.list({ :is_live => true })
puts "\nList of Posts\n"
puts JSON.pretty_generate(result)

posts = result['content']

puts "\nNumber of Posts in List"
puts posts.count

result = admin.content.list_all
puts "\nList of All Posts\n"
puts JSON.pretty_generate(result)

posts = result['content']

puts "\nNumber of Posts"
puts posts.count

first_post_id = posts[0]["id"]

result = admin.content.get(first_post_id)
puts "\nSingle Post\n"
puts JSON.pretty_generate(result)

content_type_id = result['content_type_id']
the_admin_id = admin.helper.user_id

title = 'New API Testing B'
slug = user.helper.slugify(title)
body = 'Sed viverra augue tellus nulla sollicitudin scelerisque, scelerisque rutrum mauris pharetra tempor donec arcu, ante nunc ipsum donec nec dis vitae, ipsum tempor. Vel volutpat, sed vel imperdiet, vehicula auctor purus in, eu non tempor amet euismod ligula dictumst, massa orci posuere cras varius suscipit ac. Erat dui. Vitae purus suspendisse facilisi vivamus, ligula placerat pede lorem amet, sociosqu mauris, hendrerit mollis nulla in, sed at ante imperdiet. Nulla nonummy, purus pede at id sem morbi, pariatur aliquet massa donec suspendisse mi, integer malesuada velit aenean.Wisi nulla at ut ornare, risus elit convallis orci volutpat quam scelerisque. Vestibulum pretium scelerisque. Pulvinar placerat id dictum eros a, sed facilisi vulputate ut integer, nec lacinia magna dolore dolor lacus, sed scelerisque vel dolor adipiscing sagittis. Natus urna a faucibus eu iaculis consectetuer, vivamus massa sed, vel et, morbi rhoncus nibh, etiam wisi iaculis amet dolor pharetra nisl. Amet ante rhoncus leo vel dictum, morbi duis massa, pretium amet vitae, eleifend laoreet mattis id imperdiet integer.'

result = user.content.add(the_admin_id,title,body,content_type_id,{ :url_lookup_token => slug, :publish_date => Time.now })
puts "\nPost Creation\n"
puts JSON.pretty_generate(result)

new_post_id = result["id"]

new_body = "Lorem ipsum dolor sit amet pretty easy. Maybe this site is a result of that Bureau. Nor the gas temperature, soft anyone pregnant of life, tourism and the box. In order to antioxidants, around the world, and the driver's members, through the kitchen window of the mourning of the bed, the likelihood of a lake or the Vikings, or none. But the impact now. We aim to maintain a level playing put, but not a lot of concrete financial or strategic, but now this bed. Police at the time of unemployment. You need medical attention but do not need more comprehensive evaluation. Marketing is designed and executed OK. But this time the football club football chat. Now ones exam, is made to that employee in good time or psyche. Smartphones. But that's not a large pool volleyball products. Developers, from a trading nation, and in Japan the package."

result = user.content.update(new_post_id,{ :post_text => new_body })
puts "\nPost Update\n"
puts JSON.pretty_generate(result)

idea_title = 'New API Idea A'

result = user.content.idea(idea_title,{})
puts "\nIdea Creation\n"
puts JSON.pretty_generate(result)

result = admin.content.approve(first_post_id)
puts "\nApprove Content\n"
puts JSON.pretty_generate(result)

first_approved = admin.helper.first_live_post

post_id = first_approved['id']

result = admin.content.take_down(post_id)
puts "\nTakedown Content\n"
puts JSON.pretty_generate(result)


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

posts = result['content']

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


# Content Types

result = admin.content_type.list
puts "\nContent Types\n"
puts JSON.pretty_generate(result)

first_content_type_id = result[0]['id']

result = admin.content_type.get(first_content_type_id)
puts "\nFirst Content Type\n"
puts JSON.pretty_generate(result)

name = 'API Content Type'
config = { :related_content => false }
options = { :icon => 'fa-cloud-upload', :primary_editor => 'image' }

result = admin.content_type.add(name,config,options)
puts "\nNew Content Type\n"
puts JSON.pretty_generate(result)

new_content_type_id = result['id']

config = { :content_score => false, :related_content => true }

result = admin.content_type.edit(new_content_type_id,config,{})
puts "\nEdit Content Type\n"
puts JSON.pretty_generate(result)

result = admin.content_type.delete(new_content_type_id)
puts "\nDelete Content Type\n"
puts JSON.pretty_generate(result)


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

result = admin.custom_field.edit(last_cf_id,{ :visibility => "advanced", :field_id => Time.new.to_i.to_s, :type => "multi-predefined", :options => ["Red","White","Blue","Purple"] })
puts "\nEdit Custom Field\n"
puts JSON.pretty_generate(result)

result = admin.custom_field.delete(last_cf_id)
puts "\nDelete Custom Field\n"
puts JSON.pretty_generate(result)


#Export

result = admin.export
#puts result

puts "\nExporting content to content_export.xml\n"
File.open('content_export.xml', 'w') { |file| file.write(result) }


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


# Projects

result = admin.project.list
puts "\nProject List\n"
puts JSON.pretty_generate(result)

first_project_id = result[0]["id"]

result = admin.project.get(first_project_id)
puts "\nFirst Project\n"
puts JSON.pretty_generate(result)

result = admin.project.add("Test")
puts "\nNew Project\n"
puts JSON.pretty_generate(result)

new_project_id = result["id"]

result = admin.project.edit(new_project_id, { :color => "#fff000" })
puts "\nEdit Project\n"
puts JSON.pretty_generate(result)

result = admin.project.delete(new_project_id)
puts "\nDelete Project\n"
puts JSON.pretty_generate(result)


#Publishers

result = user.publisher.list
puts "\nList of Publishers\n"
puts JSON.pretty_generate(result)

publishers = result

puts "\nPublisher Count\n"
puts publishers.count

publishers.each do |pub|
  if pub["default"] == "true"
    puts "\nDefault Publisher: #{pub['publisher_name']}\n"
  end
end

first_pub_id = publishers[0]["id"]

result = admin.publisher.get(first_pub_id)
puts "\nFirst Publisher\n"
puts JSON.pretty_generate(result)


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
first_user_id = result[0]["user_id"]
result = admin.user.get(first_user_id)
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


# Task

result = admin.task.my_current_tasks()
puts "\nAdmin Pending Tasks\n"
puts JSON.pretty_generate(result)

result = user.content.list({ :Count => '1' })
post_id =  result['content'][0]['id']

result = user.task.get_post_tasks(post_id)
puts "\nPost Tasks\n"
puts JSON.pretty_generate(result)

result = user.task.get_current_task(post_id)
puts "\nCurrent Post Tasks\n"
puts JSON.pretty_generate(result)

result = user.task.my_current_tasks()
puts "\nUser Pending Tasks\n"
puts JSON.pretty_generate(result)

task_id = result[0]['id']

result = user.task.complete(task_id)
puts "\nComplete Post Task\n"
puts JSON.pretty_generate(result)

result = user.task.uncomplete(task_id)
puts "\nUncomplete Post Task\n"
puts JSON.pretty_generate(result)


#User

result = admin.user.get
puts "\nSelf\n"
puts JSON.pretty_generate(result)

result = admin.user.list
puts "\nList of Users\n"

users = result

users.each do |user|
	puts "username: #{user['username']} roles: #{user['roles']}"
end

first_user_id = users[0]["user_id"]

result = admin.user.get(first_user_id)
puts "\nSingle User\n"
puts JSON.pretty_generate(result)

username = "apicreateduser"
firstname = "Test Api"
lastname = "User"
email = "tuser@gmail.com"

result = admin.user.add(username,firstname,lastname,email)
puts "\nAdd User\n"
puts JSON.pretty_generate(result)

new_user_id = result["Success"]["UserId"]

result = admin.user.edit(new_user_id, {:UserName => Time.new.to_i, :FirstName => "John", :EmailAddress => "jsmith@live.com", :BlogTitle => 'John Smith', :BlogDescription => "John's Blog", :Timezone => 'America/Indianapolis' })
puts "\nEdit User\n"
puts JSON.pretty_generate(result)