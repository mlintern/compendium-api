module Nretnil
  module CompendiumAPI

    class Compendium
      
      def add_user(username,firstname,lastname,email)
        response = Authentication.post('/app/user/add', :basic_auth => @auth, :body => { :UserName => username, :FirstName => firstname, :LastName => lastname, :EmailAddress => email })
      end

      def edit_user(id,attributes)
        response = Authentication.post('/app/user/edit', :basic_auth => @auth, :body => { :UserId => id, :Attributes => attributes.to_json });
      end
    
    end

  end
end