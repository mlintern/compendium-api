# encoding: utf-8
# frozen_string_literal: true
module Nretnil
  module CompendiumAPI
    # CompendiumPublic Class
    class CompendiumPublic
      def content
        ContentPublicAPI.new(self)
      end
    end

    # CompendiumPublicApI Class
    class ContentPublicAPI
      def initialize(s)
        @session = s
      end

      def list(publisher_id, options = {})
        query = options
        @session.get('/api/publishers/' + publisher_id + '/feed', query)
      end

      def get(publisher_id, content_id, options = {})
        query = options
        @session.get('/api/publishers/' + publisher_id + '/feed/' + content_id, query)
      end

      def required_params
        @auth
      end
    end
  end
end
