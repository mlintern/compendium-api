# encoding: utf-8
# frozen_string_literal: true
module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def app
        AppAPI.new(self)
      end
    end

    # AppAPI Class
    class AppAPI
      def initialize(s)
        @session = s
      end

      def list(options = {})
        defaults = {}
        query = defaults.merge(options)
        @session.get('/api/apps', query)
      end

      def get(app_id)
        @session.post('/api/apps/' + app_id)
      end

      def add(name, options = {})
        manditory = { app_name: name }
        body = manditory.merge(options)
        @session.post('/api/apps', body.to_json)
      end

      def extension(app_id, options = {})
        manditory = { app_id: app_id }
        body = manditory.merge(options)
        @session.post('/api/app_extensions', body.to_json)
      end

      def edit(app_id, options)
        @session.put('/api/apps/' + app_id, options)
      end

      def delete(app_id)
        @session.delete('/api/apps/' + app_id)
      end

      def required_params
        @auth
      end
    end
  end
end
