# frozen_string_literal: true

require 'rubygems'
require 'httparty'

module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      include HTTParty
      headers 'Accept' => 'application/vnd.compendium.blog;version=2,application/json'
      attr_accessor :auth
      debug_output $stderr if ENV['HTTPARTY_DEBUG'] == 'true'
      @timeout_in_seconds = ENV['HTTPARTY_TIMEOUT'].to_i || 60
      unless ENV['http_proxy'] == '' || ENV['http_proxy'].nil?
        proxy = ENV['http_proxy'].gsub('http://', '').gsub('https://', '').split(':')
        http_proxy proxy[0], proxy[1]
      end

      def initialize(user, api_key, server)
        @auth = { username: user, password: api_key }
        self.class.base_uri server
      end

      def username
        @auth['username']
      end

      def get(path, query = {})
        response = Compendium.get(path, basic_auth: @auth, query: query, verify: false, timeout: @timeout_in_seconds)
        if response.code.between?(200, 202)
          response
        else
          error(response)
        end
      end

      def put(path, body, query = {}, headers = { 'Content-Type' => 'application/x-json' })
        response = Compendium.put(path, basic_auth: @auth, body: body, query: query, headers: headers, verify: false, timeout: @timeout_in_seconds)
        if response.code.between?(200, 202)
          response
        else
          error(response)
        end
      end

      def post(path, body, query = {}, headers = {})
        response = Compendium.post(path, basic_auth: @auth, body: body, query: query, headers: headers, verify: false, timeout: @timeout_in_seconds)
        if response.code.between?(200, 202)
          response
        else
          error(response)
        end
      end

      def delete(path, body = {}, query = {})
        response = Compendium.delete(path, basic_auth: @auth, body: body, query: query, verify: false, timeout: @timeout_in_seconds)
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
