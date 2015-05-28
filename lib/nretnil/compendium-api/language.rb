module Nretnil
  module CompendiumAPI

    class Compendium

      def language
        LanguageAPI.new(self)
      end

    end

    class LanguageAPI

      def initialize(s)
        @session = s
      end

      def list
        response = @session.get( '/api/languages', {} )
      end
      
      def add(name,code)
        body = { :name => name, :code => code }
        response = @session.post( '/api/languages', body.to_json)
      end

      def edit(id,options)
        response = @session.put( '/api/languages/' + id, options.to_json )
      end

      def delete(id)
        response = @session.delete( '/api/languages/' + id )
      end

      def required_params
        @auth
      end
    
    end

  end
end