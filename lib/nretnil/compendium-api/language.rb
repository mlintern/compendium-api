# encoding: utf-8
# frozen_string_literal: true

module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def language
        LanguageAPI.new(self)
      end
    end

    # LanguageAPI Class
    class LanguageAPI
      def initialize(s)
        @session = s
      end

      def list
        @session.get('/api/languages', {})
      end

      def add(name, code)
        body = { name: name, code: code }
        @session.post('/api/languages', body.to_json)
      end

      def edit(id, options)
        @session.put('/api/languages/' + id, options.to_json)
      end

      def delete(id)
        @session.delete('/api/languages/' + id)
      end

      def required_params
        @auth
      end
    end
  end
end
