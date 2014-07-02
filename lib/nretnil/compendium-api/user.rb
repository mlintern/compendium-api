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

      def list(options = {})
        defaults = { :SearchString => "", :Status => "Enabled" }
        query = defaults.merge(options)
        response = @session.get( '/app/users', query )
      end

      def get(user_id = "")
        query = {}
        response = @session.get( '/app/user/' + user_id, query )
      end
      
      def add(username,firstname,lastname,email)
        query = { :UserName => username, :FirstName => firstname, :LastName => lastname, :EmailAddress => email }
        response = @session.post( '/app/user', query )
      end

      def edit(id,attributes)
        response = @session.post( '/app/user/edit', { :UserId => id, :Attributes => attributes.to_json } );
      end

      def required_params
        @auth
      end
    
    end

  end
end