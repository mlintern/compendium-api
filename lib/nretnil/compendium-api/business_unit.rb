module Nretnil
  module CompendiumAPI

    class Compendium

      def business_unit
        BusinessUnitAPI.new(self)
      end

      alias_method :bu, :business_unit

    end

    class BusinessUnitAPI

      def initialize(s)
        @session = s
      end

      def list(options = {})
        response = @session.get( '/api/business_units', options )
      end

      def add(name,publisher_ids,options = {})
        body = { :name => name, :publishers => publisher_ids, :default_publisher_id => publisher_ids[0] }.merge(options)
        response = @session.post( '/api/business_units', body.to_json)
      end

      def edit(id,options)
        response = @session.put( '/api/business_units/' + id, options.to_json )
      end

      def required_params
        @auth
      end
    
    end

  end
end