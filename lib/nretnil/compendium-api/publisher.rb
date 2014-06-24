module Nretnil
  module CompendiumAPI

    class Compendium

      def publisher
        PublisherAPI.new(self)
      end

    end

    class PublisherAPI

      def initialize(s)
        @session = s
      end

      def list(options = {})
        defaults = {}
        query = defaults.merge(options)
        response = @session.get( '/api/publishers', query )
      end

      def get(publisher_id)
        query = {}
        response = @session.get( '/api/publishers/' + publisher_id, query )
      end

      def required_params
        @auth
      end
    
    end

  end
end