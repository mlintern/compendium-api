require 'rubygems'
require 'bundler/setup'
require 'compendium-api'
require 'json'

#Authentication

admin = "<username>"
akey = "<api_key>"
server = "https://app.test.compendium.com"

admin = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)

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
	puts event
end

result = admin.calendar.delete(new_event_id)
puts "\nDelete Event\n"
puts JSON.pretty_generate(result)