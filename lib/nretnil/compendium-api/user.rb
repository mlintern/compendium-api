require 'rubygems'
require 'httparty'

module Nretnil
  module CompendiumAPI

    class User
      include HTTParty
      
      def add_user(username,firstname,lastname,email)
        response = Compendium.post('/app/user/add', :basic_auth => @auth, :body => { :UserName => username, :FirstName => firstname, :LastName => lastname, :EmailAddress => email })
      end

      def edit_user(id,attributes)
        response = Compendium.post('/app/user/edit', :basic_auth => @auth, :body => { :UserId => id, :Attributes => attributes.to_json });
      end
    
    end

  end
end