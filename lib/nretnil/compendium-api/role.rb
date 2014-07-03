module Nretnil
  module CompendiumAPI

    class Compendium

      def role
        RoleAPI.new(self)
      end

    end

    class RoleAPI

      def initialize(s)
        @session = s
      end

      def list(options = {})
        defaults = {}
        query = defaults.merge(options)
        response = @session.get( '/api/roles', query )
      end
      
      def add(name,permissions)
        body = { :name => name, :permissions => permissions }
        response = @session.post( '/api/roles', body.to_json )
      end

      def edit(role_id,options)
        body = options
        response = @session.put( '/api/roles/' + role_id, body.to_json );
      end

      def assign(user_id,roles)
        body = { :roles => roles }
        response = @session.put( '/api/users/' + user_id + '/roles', body.to_json );
      end

      def delete(role_id)
        response = @session.delete( '/api/roles/' + role_id );
      end

      def required_params
        @auth
      end
    
    end

  end
end