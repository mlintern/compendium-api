module Nretnil
  module CompendiumAPI

    class Compendium

      def list_categories(options)
        query = options
        response = Compendium.get('/app/blogs', :basic_auth => @auth, :query => query, :verify => false )
      end

      def add_category(title,type,options)
        query = { :Title => title, :Type => type }
        query = options.merge(query)
        response = Compendium.post('/app/blog', :basic_auth => @auth, :body => query, :verify => false )
      end

      def delete_category(category_id)
        response = Compendium.delete('/app/blog/' + category_id, :basic_auth => @auth, :verify => false )
      end
    
    end

  end
end