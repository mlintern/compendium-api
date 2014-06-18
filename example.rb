require 'rubygems'
require 'compendium-api'

user = "markuser"
key = "MXOQiEuFMKmnSAeqXbpppGigIf8eTHyFEk5MPN2B"
server = "https://app.compendium.com"

session = Nretnil::CompendiumAPI::Compendium.new(user, key, server)

result = session.list_posts(1,'',['approved'])

#puts result

posts = result['Success'];

#puts posts

first_post_id = posts[0]["PostId"]

result = session.get_post(first_post_id)

puts result 