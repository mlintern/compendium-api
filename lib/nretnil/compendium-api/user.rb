module Nretnil
  module CompendiumAPI

    class Compendium

      def user
        UserAPI.new(self)
      end

    end

    class UserAPI

      def initialize(s)
        @session = s
      end

      def list(options)
        query = options
        response = Compendium.post( '/app/users', query )
      end
      
      def add(username,firstname,lastname,email)
        query = { :UserName => username, :FirstName => firstname, :LastName => lastname, :EmailAddress => email }
        response = Compendium.post( '/app/user/add', query )
      end

      def edit(id,attributes)
        response = Compendium.post( '/app/user/edit', { :UserId => id, :Attributes => attributes.to_json } );
      end

      def required_params
        @auth
      end
    
    end

  end
end