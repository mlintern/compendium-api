require 'rubygems'
require 'bundler/setup'
require 'compendium-api'

#Authentication

admin = "<username>"
akey = "<api_key>"
server = "https://app.test.compendium.com"

admin = Nretnil::CompendiumAPI::Compendium.new(admin, akey, server)

#Export

result = admin.export
puts result

puts "\nExporting content to content_export.xml\n"
File.open('content_export.xml', 'w') { |file| file.write(result) }