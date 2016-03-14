module Nretnil
  module CompendiumAPI

    class Compendium

      def app_provider
        AppProviderAPI.new(self)
      end

    end

    class AppProviderAPI

      def initialize(s)
        @session = s
      end

      def list(options = {})
        defaults = {}
        query = defaults.merge(options)
        response = @session.get( '/api/app_providers', query )
      end

      def get(provider_id)
        response = @session.post( '/api/app_providers/' + provider_id )
      end

      def add(name, options = {})
        defaults = { :provider_name => name }
        body = defaults.merge(options)
        response = @session.post( '/api/app_providers', body.to_json )
      end

      def edit(provider_id, options)
        response = @session.put( '/api/app_providers/' + provider_id, options )
      end

      def delete(provider_id)
        response = @session.delete( '/api/app_providers/' + provider_id );
      end

      def required_params
        @auth
      end
    
    end

  end
end