require 'rubygems'
require 'httparty'

module Nretnil
  module CompendiumAPI

    class Compendium
      include HTTParty
      format :json
      headers "Accept" => "application/vnd.compendium.blog;version=2,application/json"
      attr_accessor :auth

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