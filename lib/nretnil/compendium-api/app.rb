module Nretnil
  module CompendiumAPI

    class Compendium

      def app
        AppAPI.new(self)
      end

    end

    class AppAPI

      def initialize(s)
        @session = s
      end

      def list(options = {})
        defaults = {}
        query = defaults.merge(options)
        response = @session.get( '/api/apps', query )
      end

      def get(app_id)
        response = @session.post( '/api/apps/' + app_id )
      end

      def add(name, options = {})
        manditory = { :app_name => name }
        body = manditory.merge(options)
        response = @session.post( '/api/apps', body.to_json )
      end

      def extension(app_id, options = {})
        manditory = { :app_id => app_id }
        body = manditory.merge(options)
        response = @session.post( '/api/app_extensions', body.to_json )
      end

      def edit(app_id, options)
        response = @session.put( '/api/apps/' + app_id, options )
      end

      def delete(app_id)
        response = @session.delete( '/api/apps/' + app_id );
      end

      def required_params
        @auth
      end
    
    end

  end
end