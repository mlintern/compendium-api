module Nretnil
  module CompendiumAPI

    class Compendium

      def project
        ProjectAPI.new(self)
      end

    end

    class ProjectAPI

      def initialize(s)
        @session = s
      end

      def list(options = {})
        defaults = { :include_description => true }
        query = defaults.merge(options)
        response = @session.get( '/api/campaigns', query )
      end

      def get(id)
        response = @session.get( '/api/campaigns/' + id, {} )
      end
      
      def add(name,options = {})
        body = { :name => name, :all_business_units => true, :business_units => [] }.merge(options)
        response = @session.post( '/api/campaigns', body.to_json)
      end

      def edit(id,options)
        response = @session.put( '/api/campaigns/' + id, options.to_json )
      end

      def delete(id)
        response = @session.delete( '/api/campaigns/' + id )
      end

      def required_params
        @auth
      end
    
    end

  end
end