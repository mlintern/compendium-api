# frozen_string_literal: true

module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def persona
        PersonaAPI.new(self)
      end
    end

    # PersonaAPI Class
    class PersonaAPI
      def initialize(s)
        @session = s
      end

      def list
        @session.get('/api/personas', {})
      end

      def get(id)
        @session.get('/api/personas/' + id, {})
      end

      def add(name, options = {})
        body = { name: name, all_business_units: true, business_units: [] }.merge(options)
        @session.post('/api/personas', body.to_json)
      end

      def edit(id, options)
        @session.put('/api/personas/' + id, options.to_json)
      end

      def delete(id)
        @session.delete('/api/personas/' + id)
      end

      def required_params
        @auth
      end
    end
  end
end
