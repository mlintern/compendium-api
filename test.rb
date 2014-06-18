require 'rubygems'
require 'compendium-api'

user = "markuser"
key = "MXOQiEuFMKmnSAeqXbpppGigIf8eTHyFEk5MPN2B"
server = "https://app.compendium.com"

session = Nretnil::CompendiumAPI::Compendium.new(user, key, server)

result = session.list_posts()

puts result