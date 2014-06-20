require 'rubygems'
require 'bundler/setup'
require 'compendium-api'

user = "<username>"
key = "<api_key>"
admin = "<username>"
akey = "<api_key>"
server = "https://app.test.compendium.com"

user = Nretnil::CompendiumAPI::Compendium.new(user, key, server)
admin = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)
helper = Nretnil::CompendiumAPI::Helpers.new


#Posts

result = user.content.list({ :Status => ["approved"].to_json})
puts "\nList of Posts\n"
puts result

posts = result['Success']

first_post_id = posts[0]["PostId"]

result = user.content.get(first_post_id)
puts "\nSingle Post\n"
puts result

title = 'API Testing'
slug = helper.slugify(title)
body = 'Sed viverra augue tellus nulla sollicitudin scelerisque, scelerisque rutrum mauris pharetra tempor donec arcu, ante nunc ipsum donec nec dis vitae, ipsum tempor. Vel volutpat, sed vel imperdiet, vehicula auctor purus in, eu non tempor amet euismod ligula dictumst, massa orci posuere cras varius suscipit ac. Erat dui. Vitae purus suspendisse facilisi vivamus, ligula placerat pede lorem amet, sociosqu mauris, hendrerit mollis nulla in, sed at ante imperdiet. Nulla nonummy, purus pede at id sem morbi, pariatur aliquet massa donec suspendisse mi, integer malesuada velit aenean.Wisi nulla at ut ornare, risus elit convallis orci volutpat quam scelerisque. Vestibulum pretium scelerisque. Pulvinar placerat id dictum eros a, sed facilisi vulputate ut integer, nec lacinia magna dolore dolor lacus, sed scelerisque vel dolor adipiscing sagittis. Natus urna a faucibus eu iaculis consectetuer, vivamus massa sed, vel et, morbi rhoncus nibh, etiam wisi iaculis amet dolor pharetra nisl. Amet ante rhoncus leo vel dictum, morbi duis massa, pretium amet vitae, eleifend laoreet mattis id imperdiet integer.'

result = user.content.add(title,body,slug,Time.new,false,{})
puts "\nPost Creation\n"
puts result

new_post_id = result["Success"]

result = admin.content.approve([new_post_id])
puts "\nApprove Content\n"
puts result

result = admin.content.decline([new_post_id])
puts "\nDecline Content\n"
puts result

puts "\nNumber of Posts in List"
puts posts.count


#Category

result = admin.category.list({ :NetworkId => "758c2424-6055-4d3e-880c-4021718d814e" })
puts "\nList of Categories\n"
puts result

result = admin.category.add("API Category","category")
puts "\nCreate Category\n"
puts result

new_id = result["Success"]

token = helper.slugify("API Edited Title")
result = admin.category.edit(new_id, { :Title => "API Edited Title" })
puts "\nEdit Category\n"
puts result

result = admin.category.delete(new_id)
puts "\nDelete Category\n"
puts result


#User

result = admin.user.list
puts "\nList of Users\n"

users = result["Success"]

users.each do |user|
	puts "username: #{user['UserName']} roles: #{user['Roles']}"
end

first_user_id = users[0]["UserId"]

result = admin.user.get(first_user_id)
puts "\nSingle User\n"
puts result

username = "apicreated"
firstname = "Test Api"
lastname = "User"
email = "tuser@gmail.com"

result = admin.user.add(username,firstname,lastname,email)
puts "\nAdd User\n"
puts result

new_user_id = result["Success"]["UserId"]

result = admin.user.edit(new_user_id, {:UserName => Time.new.to_i, :FirstName => "Johnathon", :EmailAddress => "jsmith@live.com" })
puts "\nEdit User\n"
puts result


#Comment

result = admin.comment.list({})
puts "\nList of Comments\n"
puts result

comments = result["Success"]

first_comment_id = comments[0]["CommentId"]

result = admin.comment.get(first_comment_id)
puts "\nFirst Comment\n"
puts result

post_id = "d9a0ad5c-6f81-454e-a751-55bd47af05e4"
body = "Comment Text"
time = Time.new.iso8601
name = "John Smith"
email = "jsmith@gmail.com"

result = admin.comment.add(post_id, body, time, name, email)
puts "\nCreate Comment\n"
puts result

new_comment_id = result["Success"]

result = admin.comment.approve([new_comment_id])
puts "\nApprove Comment\n"
puts result

result = admin.comment.decline([new_comment_id])
puts "\nDecline Comment\n"
puts result

