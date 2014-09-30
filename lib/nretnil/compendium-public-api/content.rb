module Nretnil
  module CompendiumAPI

    class CompendiumPublic

      def content
        ContentPublicAPI.new(self)
      end

    end

    class ContentPublicAPI

      def initialize(s)
        @session = s
      end

      def list(publisher_id, options = {})
        query = options
        response = @session.get( '/api/' + publisher_id + '/feed', query )
      end

      def get(publihser_id, content_id, options = {})
        query = options
        response = @session.get( '/api/' + publisher_id + '/feed/' + content_id, query )
      end

      def required_params
        @auth
      end

    end

  end
end