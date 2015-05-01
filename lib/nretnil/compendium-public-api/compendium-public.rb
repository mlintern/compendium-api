require 'rubygems'
require 'httparty'

module Nretnil
  module CompendiumAPI

    class CompendiumPublic
      include HTTParty
      headers "Accept" => "application/vnd.compendium.blog;version=2,application/json"
      attr_accessor :auth
      if ENV['DEBUG'] == 'true'
        debug_output $stderr
      end

      def initialize(server)
        self.class.base_uri server
      end

      def get(path,query = {})
        response = CompendiumPublic.get(path, :query => query, :verify => false )
        if response.code.between?(200,202)
          response
        else
          error(response)
        end
      end

      def post(path,body)
        response = CompendiumPublic.post(path, :body => body, :verify => false )
        if response.code.between?(200,202)
          response
        else
          error(response)
        end
      end

      def info(text)
        response = { :info => text }
      end

      def error(response)
        response = { :error => { :status => response.code, :message => response.message, :response => response.parsed_response } }
      end

      def required_params
        @auth
      end

    end

  end
end