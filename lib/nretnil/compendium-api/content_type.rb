module Nretnil
  module CompendiumAPI

    class Compendium

      def content_type
        ContentTypeAPI.new(self)
      end

    end

    class ContentTypeAPI

      def initialize(s)
        @session = s
      end

      def list
        query = {}
        response = @session.get( '/api/content_types', query )
      end

      def get(id)
        query = {}
        response = @session.get( '/api/content_types/' + id, query )
      end
      
      def add(name,config = {},options = {})
        default_config = { :content_score => true, :related_content => true }
        new_config = default_config.merge(config)
        default_options = { :icon => "fa-align-left", :primary_editor => "rich_text" }
        new_options = default_options.merge(options)
        body = { :name => name, :config => new_config }.merge(new_options)
        response = @session.post( '/api/content_types', body.to_json)
      end

      def edit(id,config,options)
        body = options.merge({ :config => config })
        response = @session.put( '/api/content_types/' + id, body.to_json )
      end

      def delete(id)
        response = @session.delete( '/api/content_types/' + id )
      end

      def required_params
        @auth
      end
    
    end

  end
end