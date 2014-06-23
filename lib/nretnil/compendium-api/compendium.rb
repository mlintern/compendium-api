require 'rubygems'
require 'httparty'

module Nretnil
  module CompendiumAPI

    class Compendium
      include HTTParty
      format :json
      headers "Accept" => "application/vnd.compendium.blog;version=2,application/json"
      attr_accessor :auth
      debug_output $stderr

      def initialize(u, p, b)
        @auth = {:username => u, :password => p}
        self.class.base_uri b
      end

      def get(path,query)
        Compendium.get(path, :basic_auth => @auth, :query => query, :verify => false )
      end

      def put(path,body,query={})
        Compendium.put(path, :basic_auth => @auth, :body => body, :query => query, :verify => false )
      end

      def post(path,body,query={})
        Compendium.post(path, :basic_auth => @auth, :body => body, :query => query, :verify => false )
      end

      def delete(path,body={},query={})
        Compendium.delete(path, :basic_auth => @auth, :body => body, :query => query, :verify => false )
      end

      def required_params
        @auth
      end

    end

  end
end