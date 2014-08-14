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
helper = Nretnil::CompendiumAPI::Helpers.new

#Content

result = user.content.list({ :is_live => true })
puts "\nList of Posts\n"
puts JSON.pretty_generate(result)

posts = result['posts']

puts "\nNumber of Posts in List"
puts posts.count

result = admin.content.list_all
puts "\nList of All Posts\n"
puts JSON.pretty_generate(result)

posts = result['posts']

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

result = user.content.add(the_admin_id,title,body,slug,Time.new,content_type_id,{})
puts "\nPost Creation\n"
puts JSON.pretty_generate(result)

new_post_id = result["id"]

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