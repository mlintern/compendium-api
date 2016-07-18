# encoding: utf-8
# frozen_string_literal: true
module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def publisher
        PublisherAPI.new(self)
      end
    end

    # PublisherAPI Class
    class PublisherAPI
      def initialize(s)
        @session = s
      end

      def list(options = {})
        @session.get('/api/publishers', options)
      end

      def get(publisher_id)
        query = {}
        @session.get('/api/publishers/' + publisher_id, query)
      end

      def add(name, hostname, options = {})
        body = { publisher_name: name, publisher_title: name, hostname: hostname, uri_base: '/', publisher_type: 'compendium', page_title_format: 'SHORT' }.merge(options)
        @session.post('/api/publishers', body.to_json, {}, 'Content-Type' => 'application/x-json')
      end

      def edit(publisher_id, config)
        @session.put('/api/publishers/' + publisher_id, config.to_json, {}, 'Content-Type' => 'application/x-json')
      end

      def required_params
        @auth
      end
    end
  end
end
