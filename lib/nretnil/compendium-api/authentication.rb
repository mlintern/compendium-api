require 'rubygems'
require 'httparty'

module Nretnil
  module CompendiumAPI

    class Authentication
      include HTTParty
      base_uri 'https://app.compendium.com'
      format :json
      headers "Accept" => "application/vnd.compendium.blog;version=2,application/json"

      def initialize(u, p, b)
        @auth = {:username => u, :password => p}
        self.class.base_uri b
      end

      def required_params
        @auth
      end
    end

  end
end