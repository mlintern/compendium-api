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
        response = @session.get( '/api/publishers', options )
      end

      def get(publisher_id)
        query = {}
        response = @session.get( '/api/publishers/' + publisher_id, query )
      end

      def add(name,hostname,options = {})
        body = { :publisher_name => name, :publisher_title => name, :hostname => hostname, :uri_base => "/", :publisher_type => "compendium", :page_title_format => "SHORT" }.merge(options)
        response = @session.post( '/api/publishers', body.to_json, {}, { "Content-Type" => "application/x-json" } )
      end

      def edit(publisher_id,config)
        response = @session.put( '/api/publishers/' + publisher_id, config.to_json, {}, { "Content-Type" => "application/x-json" } )
      end

      def required_params
        @auth
      end
    
    end

  end
end