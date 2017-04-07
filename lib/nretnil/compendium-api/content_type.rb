# encoding: utf-8
# frozen_string_literal: true

module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def content_type
        ContentTypeAPI.new(self)
      end
    end

    # ContentTypeAPI Class
    class ContentTypeAPI
      def initialize(s)
        @session = s
      end

      def list
        query = {}
        @session.get('/api/content_types', query)
      end

      def get(id)
        query = {}
        @session.get('/api/content_types/' + id, query)
      end

      def add(name, config = {}, options = {})
        default_options = { icon: 'fa-align-left', primary_editor: 'rich_text' }
        new_options = default_options.merge(options)
        body = { name: name, config: config }.merge(new_options)
        @session.post('/api/content_types', body.to_json)
      end

      def edit(id, config, options)
        body = options.merge(config: config)
        @session.put('/api/content_types/' + id, body.to_json)
      end

      def delete(id)
        @session.delete('/api/content_types/' + id)
      end

      def required_params
        @auth
      end
    end
  end
end
