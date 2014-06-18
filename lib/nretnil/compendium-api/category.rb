module Nretnil
  module CompendiumAPI

    class Compendium

      def list_categories(network_id = nil)
        query = { :NetworkId => network_id }
        response = Compendium.get('/app/blogs', :basic_auth => @auth, :query => query )
      end

      def add_manual_category(title,type,network_id = nil)
        query = { :Title => title, :Type => type, :NetworkId => network_id }
        response = Compendium.post('/app/blog', :basic_auth => @auth, :body => query)
      end

      def delete_category(category_id)
        response = Compendium.delete('/app/blog/' + category_id, :basic_auth => @auth )
      end
    
    end

  end
end