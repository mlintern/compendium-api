require 'rubygems'
require 'httparty'

module Nretnil
  module CompendiumAPI

    class CompendiumPublic
      include HTTParty
      format :json
      headers "Accept" => "application/vnd.compendium.blog;version=2,application/json"
      attr_accessor :auth
      if ENV['DEBUG'] == 'true'
        debug_output $stderr
      end

      def initialize(server)
        self.class.base_uri server
      end

      def get(path,query = {})
        response = Compendium.get(path, :query => query, :verify => false )
        if response.code.between?(200,202)
          response
        else
          error(response.code,response.message)
        end
      end

      def info(text)
        response = { :info => text }
      end

      def error(code,message)
        response = { :error => { :status => code, :message => message } }
      end

      def required_params
        @auth
      end

    end

  end
end