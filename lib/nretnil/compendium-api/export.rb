module Nretnil
  module CompendiumAPI

    class Compendium

      def export
        query = {}
        response = Compendium.get('/api/wordpress_export', :format => 'xml', :basic_auth => @auth, :query => query, :verify => false )
      end

    end

  end
end