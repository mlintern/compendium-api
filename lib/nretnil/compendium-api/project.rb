# encoding: utf-8
# frozen_string_literal: true

module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def project
        ProjectAPI.new(self)
      end
    end

    # ProjectAPI Class
    class ProjectAPI
      def initialize(s)
        @session = s
      end

      def list(options = {})
        defaults = { include_description: true }
        query = defaults.merge(options)
        @session.get('/api/campaigns', query)
      end

      def get(id)
        @session.get('/api/campaigns/' + id, {})
      end

      def add(name, options = {})
        body = { name: name, all_business_units: true, business_units: [] }.merge(options)
        @session.post('/api/campaigns', body.to_json)
      end

      def edit(id, options)
        @session.put('/api/campaigns/' + id, options.to_json)
      end

      def delete(id)
        @session.delete('/api/campaigns/' + id)
      end

      def required_params
        @auth
      end
    end
  end
end
