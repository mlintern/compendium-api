module Nretnil
  module CompendiumAPI

    class Compendium

      def category
        CategoryAPI.new(self)
      end

    end

    class CategoryAPI

      def initialize(s)
        @session = s
      end

      def list(options = {})
        query = options
        response = @session.get( '/app/blogs', query )
      end

      def add(title,type,options = {})
        manditory = { :Title => title, :Type => type }
        query = manditory.merge(options)
        response = @session.post( '/app/blog', query )
      end

      def edit(id,attributes)
        query = { :BlogId => id, :Attributes => attributes.to_json }
        response = @session.post( '/app/blog/edit', query );
      end

      def delete(category_id)
        response = @session.delete( '/app/blog/' + category_id )
      end

      def required_params
        @auth
      end
    
    end

  end
end