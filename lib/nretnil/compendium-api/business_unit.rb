# encoding: utf-8
# frozen_string_literal: true

module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def business_unit
        BusinessUnitAPI.new(self)
      end

      alias bu business_unit
    end

    # BusinessUnitAPI Class
    class BusinessUnitAPI
      def initialize(s)
        @session = s
      end

      def list(options = {})
        @session.get('/api/business_units', options)
      end

      def add(name, publisher_ids, options = {})
        body = { name: name, publishers: publisher_ids, default_publisher_id: publisher_ids[0] }.merge(options)
        @session.post('/api/business_units', body.to_json)
      end

      def edit(id, options)
        @session.put('/api/business_units/' + id, options.to_json)
      end

      def required_params
        @auth
      end
    end
  end
end
