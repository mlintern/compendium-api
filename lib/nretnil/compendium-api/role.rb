# frozen_string_literal: true

module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def role
        RoleAPI.new(self)
      end
    end

    # RoleAPI Class
    class RoleAPI
      def initialize(s)
        @session = s
      end

      def list(options = {})
        defaults = {}
        query = defaults.merge(options)
        @session.get('/api/roles', query)
      end

      def add(name, permissions)
        body = { name: name, permissions: permissions }
        @session.post('/api/roles', body.to_json)
      end

      def edit(role_id, options)
        body = options
        @session.put('/api/roles/' + role_id, body.to_json)
      end

      def assign(user_id, roles)
        body = { roles: roles }
        @session.put('/api/users/' + user_id + '/roles', body.to_json)
      end

      def delete(role_id)
        @session.delete('/api/roles/' + role_id)
      end

      def required_params
        @auth
      end
    end
  end
end
