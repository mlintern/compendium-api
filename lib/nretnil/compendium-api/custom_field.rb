module Nretnil
  module CompendiumAPI

    class Compendium

      def custom_field
        CustomFieldAPI.new(self)
      end

    end

    class CustomFieldAPI

      def initialize(s)
        @session = s
      end

      def list(options = {})
        query = options
        response = @session.get( '/api/post_field_schema', query )
      end

      def get(custom_field_id = "")
        query = {}
        response = @session.get( '/api/post_field_schema/' + custom_field_id, query )
      end

      def add(label, field_id, options ={})
        defaults = { :type => "text", :label => label, :field_id => field_id, :visibility => "basic", :content_type_filter => [], :options => [] }
        body = defaults.merge(options)
        response = @session.post( '/api/post_field_schema', body.to_json )
      end

      def edit(id, options = {})
        body = options
        response = @session.put( '/api/post_field_schema/' + id, body.to_json )
      end

      def delete(custom_field_id)
        response = @session.delete( '/api/post_field_schema/' + custom_field_id )
      end

      def required_params
        @auth
      end
    
    end

  end
end