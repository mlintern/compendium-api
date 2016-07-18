# encoding: utf-8
# frozen_string_literal: true
require 'rubygems'
require 'bundler/setup'
require 'compendium-api'

# Authentication

user = '<username>'
key = '<api_key>'
admin = '<username>'
akey = '<api_key>'
server = 'https://app.test.compendium.com'

user = Nretnil::CompendiumAPI::Compendium.new(user, key, server)
admin = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)

# Task

result = admin.task.my_current_tasks
puts "\nAdmin Pending Tasks\n"
puts JSON.pretty_generate(result)

result = user.content.list(Count: '1')
post_id = result['content'][0]['id']

result = user.task.get_post_tasks(post_id)
puts "\nPost Tasks\n"
puts JSON.pretty_generate(result)

result = user.task.get_current_task(post_id)
puts "\nCurrent Post Tasks\n"
puts JSON.pretty_generate(result)

result = user.task.my_current_tasks
puts "\nUser Pending Tasks\n"
puts JSON.pretty_generate(result)

task_id = result[0]['id']

result = user.task.complete(task_id)
puts "\nComplete Post Task\n"
puts JSON.pretty_generate(result)

result = user.task.uncomplete(task_id)
puts "\nUncomplete Post Task\n"
puts JSON.pretty_generate(result)
