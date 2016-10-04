# encoding: utf-8
# frozen_string_literal: true
require 'rubygems'
require 'bundler/setup'
require 'compendium-api'

# Authentication

admin = '<username>'
akey = '<api_key>'
server = 'https://app.test.compendium.com'

admin = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)

# User

result = admin.user.list
puts "\nList of Users\n"

users = result

users.each do |user|
  puts "username: #{user['username']} - roles: #{user['roles']}"
end

first_user_id = users[0]['user_id']

result = admin.user.get(first_user_id)
puts "\nSingle User\n"
puts JSON.pretty_generate(result)

username = 'apicreateduser@' + Time.new.to_i.to_s
firstname = 'Test Api'
lastname = 'User'
email = 'tuser@gmail.com'

options = {
  blog_title: firstname + ' ' + lastname
}

result = admin.user.add(username, firstname, lastname, email, options)
puts "\nAdd User\n"
puts JSON.pretty_generate(result)

new_user_id = result['user_id']

result = admin.user.edit(new_user_id, username: Time.new.to_i, email: 'jsmith@live.com', blog_title: 'John Smith', blog_description: "John's Blog", timezone: 'America/Indianapolis')
puts "\nEdit User\n"
puts JSON.pretty_generate(result)
