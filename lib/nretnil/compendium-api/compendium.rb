require 'rubygems'
require 'httparty'

module Nretnil
  module CompendiumAPI

    class Compendium
      include HTTParty
      format :json
      headers "Accept" => "application/vnd.compendium.blog;version=2,application/json"
      attr_accessor :auth
      #debug_output $stderr

      def initialize(u, p, b)
        @auth = {:username => u, :password => p}
        self.class.base_uri b
      end

      def get(path,query)
        response = Compendium.get(path, :basic_auth => @auth, :query => query, :verify => false )
      end

      def put(path,body,query = {})
        response = Compendium.put(path, :basic_auth => @auth, :body => body, :query => query, :verify => false )
      end

      def post(path,body,query = {})
        response = Compendium.post(path, :basic_auth => @auth, :body => body, :query => query, :verify => false )
      end

      def delete(path,body = {},query = {})
        response = Compendium.delete(path, :basic_auth => @auth, :body => body, :query => query, :verify => false )
      end

      def info(text)
        response = { :info => text }
      end

      def required_params
        @auth
      end

    end

  end
end