# encoding: utf-8
# frozen_string_literal: true

module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def custom_field
        CustomFieldAPI.new(self)
      end
    end

    # CustomFieldAPI Class
    class CustomFieldAPI
      def initialize(s)
        @session = s
      end

      def list(options = {})
        query = options
        @session.get('/api/post_field_schema', query)
      end

      def get(custom_field_id = '')
        query = {}
        @session.get('/api/post_field_schema/' + custom_field_id, query)
      end

      def add(label, field_id, options = {})
        defaults = { type: 'text', label: label, field_id: field_id, visibility: 'basic', content_type_filter: [], options: [] }
        body = defaults.merge(options)
        @session.post('/api/post_field_schema', body.to_json)
      end

      def edit(id, options = {})
        body = options
        @session.put('/api/post_field_schema/' + id, body.to_json)
      end

      def delete(custom_field_id)
        @session.delete('/api/post_field_schema/' + custom_field_id)
      end

      def required_params
        @auth
      end
    end
  end
end
