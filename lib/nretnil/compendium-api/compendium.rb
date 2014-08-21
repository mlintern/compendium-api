require 'rubygems'
require 'httparty'

module Nretnil
  module CompendiumAPI

    class Compendium
      include HTTParty
      format :json
      headers "Accept" => "application/vnd.compendium.blog;version=2,application/json"
      attr_accessor :auth
      if ENV['DEBUG'] == 'true'
        debug_output $stderr
      end

      def initialize(user, api_key, server)
        @auth = {:username => user, :password => api_key}
        self.class.base_uri server
      end

      def get(path,query = {})
        response = Compendium.get(path, :basic_auth => @auth, :query => query, :verify => false )
        if response.to_json.is_json?
          response
        else
          error(response)
        end
      end

      def put(path,body,query = {})
        response = Compendium.put(path, :basic_auth => @auth, :body => body, :query => query, :verify => false )
        if response.to_json.is_json?
          response
        else
          error(response)
        end
      end

      def post(path,body,query = {})
        response = Compendium.post(path, :basic_auth => @auth, :body => body, :query => query, :verify => false )
        if response.to_json.is_json?
          response
        else
          error(response)
        end
      end

      def delete(path,body = {},query = {})
        response = Compendium.delete(path, :basic_auth => @auth, :body => body, :query => query, :verify => false )
        if response.to_json.is_json?
          response
        else
          error(response)
        end
      end

      def info(text)
        response = { :info => text }
      end

      def error(response)
        response = { :error => { :status => response.code, :message => response.message } }
      end

      def required_params
        @auth
      end

    end

  end
end