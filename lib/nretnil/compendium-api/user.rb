module Nretnil
  module CompendiumAPI

    class Compendium

      def list_users(search_string = 'nil')
        query = { :SearchString => search_string }
        response = Compendium.post('/app/users', :basic_auth => @auth, :body => query)
      end
      
      def add_user(username,firstname,lastname,email)
        query = { :UserName => username, :FirstName => firstname, :LastName => lastname, :EmailAddress => email }
        response = Compendium.post('/app/user/add', :basic_auth => @auth, :body => query)
      end

      def edit_user(id,attributes)
        response = Compendium.post('/app/user/edit', :basic_auth => @auth, :body => { :UserId => id, :Attributes => attributes.to_json });
      end
    
    end

  end
end