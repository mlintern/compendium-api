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
helper = Nretnil::CompendiumAPI::Helpers.new

#Comment

result = user.comment.list({})
puts "\nList of Comments\n"
puts JSON.pretty_generate(result)

comments = result["Success"]

first_comment_id = comments[0]["CommentId"]

result = user.comment.get(first_comment_id)
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