module Nretnil
  module CompendiumAPI

    class Compendium

      def persona
        PersonaAPI.new(self)
      end

    end

    class PersonaAPI

      def initialize(s)
        @session = s
      end

      def list
        response = @session.get( '/api/personas', {} )
      end

      def get(id)
        response = @session.get( '/api/personas/' + id, {} )
      end
      
      def add(name,options = {})
        body = { :name => name, :all_business_units => true, :business_units => [] }.merge(options)
        response = @session.post( '/api/personas', body.to_json)
      end

      def edit(id,options)
        response = @session.put( '/api/personas/' + id, options.to_json )
      end

      def delete(id)
        response = @session.delete( '/api/personas/' + id )
      end

      def required_params
        @auth
      end
    
    end

  end
end