require 'rubygems'
require 'bundler/setup'
require 'compendium-api'

user = "markuser"
key = "MXOQiEuFMKmnSAeqXbpppGigIf8eTHyFEk5MPN2B"
server = "https://app.test.compendium.com"

session = Nretnil::CompendiumAPI::Compendium.new(user, key, server)
helper = Nretnil::CompendiumAPI::Helpers.new

result = session.content.list({:Count => '20' , :Status => ["approved"].to_json, :'~Status' => ["deleted"].to_json })
puts "\nList of Posts\n"
puts result

posts = result['Success'];

first_post_id = posts[0]["PostId"]

result = session.content.get(first_post_id)
puts "\nSingle Post\n"
puts result

title = 'API Testing'
slug = helper.slugify(title)
body = 'Sed viverra augue tellus nulla sollicitudin scelerisque, scelerisque rutrum mauris pharetra tempor donec arcu, ante nunc ipsum donec nec dis vitae, ipsum tempor. Vel volutpat, sed vel imperdiet, vehicula auctor purus in, eu non tempor amet euismod ligula dictumst, massa orci posuere cras varius suscipit ac. Erat dui. Vitae purus suspendisse facilisi vivamus, ligula placerat pede lorem amet, sociosqu mauris, hendrerit mollis nulla in, sed at ante imperdiet. Nulla nonummy, purus pede at id sem morbi, pariatur aliquet massa donec suspendisse mi, integer malesuada velit aenean.Wisi nulla at ut ornare, risus elit convallis orci volutpat quam scelerisque. Vestibulum pretium scelerisque. Pulvinar placerat id dictum eros a, sed facilisi vulputate ut integer, nec lacinia magna dolore dolor lacus, sed scelerisque vel dolor adipiscing sagittis. Natus urna a faucibus eu iaculis consectetuer, vivamus massa sed, vel et, morbi rhoncus nibh, etiam wisi iaculis amet dolor pharetra nisl. Amet ante rhoncus leo vel dictum, morbi duis massa, pretium amet vitae, eleifend laoreet mattis id imperdiet integer.'

result = session.content.add(title,body,slug,Time.new,false,{})
puts "\nPost Creation\n"
puts result

puts "\nNumber of Posts in List"
puts posts.count