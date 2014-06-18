module Nretnil
  module CompendiumAPI

    class Compendium

      def list_users(options)
        query = options
        response = Compendium.post('/app/users', :basic_auth => @auth, :body => query, :verify => false )
      end
      
      def add_user(username,firstname,lastname,email)
        query = { :UserName => username, :FirstName => firstname, :LastName => lastname, :EmailAddress => email }
        response = Compendium.post('/app/user/add', :basic_auth => @auth, :body => query, :verify => false )
      end

      def edit_user(id,attributes)
        response = Compendium.post('/app/user/edit', :basic_auth => @auth, :body => { :UserId => id, :Attributes => attributes.to_json }, :verify => false );
      end
    
    end

  end
end