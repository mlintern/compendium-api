require 'rubygems'
require 'compendium_api'

user = "markuser"
key = "MXOQiEuFMKmnSAeqXbpppGigIf8eTHyFEk5MPN2B"
server = "https://app.compendium.com"

compendium = Compendium.new(user, key, server)

result = compndium.posts(1)

puts result