# encoding: utf-8
# frozen_string_literal: true
require 'rubygems'
require 'httparty'

module Nretnil
  module CompendiumAPI
    # CompendiumPUblic class
    class CompendiumPublic
      include HTTParty
      headers 'Accept' => 'application/vnd.compendium.blog;version=2,application/json'
      attr_accessor :auth
      debug_output $stderr if ENV['DEBUG'] == 'true'

      def initialize(server)
        self.class.base_uri server
      end

      def get(path, query = {})
        response = CompendiumPublic.get(path, query: query, verify: false)
        if response.code.between?(200, 202)
          response
        else
          error(response)
        end
      end

      def post(path, body)
        response = CompendiumPublic.post(path, body: body, verify: false)
        if response.code.between?(200, 202)
          response
        else
          error(response)
        end
      end

      def info(text)
        { info: text }
      end

      def error(response)
        { error: { status: response.code, message: response.message, response: response.parsed_response } }
      end

      def required_params
        @auth
      end
    end
  end
end
