# encoding: utf-8
# frozen_string_literal: true
module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def app_provider
        AppProviderAPI.new(self)
      end
    end

    # AppProviderAPI Class
    class AppProviderAPI
      def initialize(s)
        @session = s
      end

      def list(options = {})
        defaults = {}
        query = defaults.merge(options)
        @session.get('/api/app_providers', query)
      end

      def get(provider_id)
        @session.post('/api/app_providers/' + provider_id)
      end

      def add(name, options = {})
        defaults = { provider_name: name }
        body = defaults.merge(options)
        @session.post('/api/app_providers', body.to_json)
      end

      def edit(provider_id, options)
        @session.put('/api/app_providers/' + provider_id, options)
      end

      def delete(provider_id)
        @session.delete('/api/app_providers/' + provider_id)
      end

      def required_params
        @auth
      end
    end
  end
end
