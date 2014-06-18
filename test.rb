require 'rubygems'
require 'compendium_api'

user = "markadmin"
key = "p5QKOEWbPWIZ9j2aJiJSRkWnzkuuMYqZ3eKpJHr8"
server = "https://app.compendium.com"

compendium = Compendium.new(user, key, server)

result = compndium.posts(1)

puts result