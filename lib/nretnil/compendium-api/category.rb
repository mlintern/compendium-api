# encoding: utf-8
# frozen_string_literal: true

module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def category
        CategoryAPI.new(self)
      end
    end

    # CategoryAPI Class
    class CategoryAPI
      def initialize(s)
        @session = s
      end

      def list(options = {})
        query = options
        @session.get('/app/blogs', query)
      end

      def add(title, type, options = {})
        manditory = { Title: title, Type: type }
        query = manditory.merge(options)
        @session.post('/app/blog', query)
      end

      def edit(id, attributes)
        query = { BlogId: id, Attributes: attributes.to_json }
        @session.post('/app/blog/edit', query)
      end

      def delete(category_id)
        @session.delete('/app/blog/' + category_id)
      end

      def required_params
        @auth
      end
    end
  end
end
