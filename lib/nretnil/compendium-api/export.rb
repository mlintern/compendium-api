# encoding: utf-8
# frozen_string_literal: true
module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def export
        query = {}
        Compendium.get('/api/wordpress_export', format: 'xml', basic_auth: @auth, query: query, verify: false)
      end
    end
  end
end
