# encoding: utf-8
# frozen_string_literal: true
module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def user
        UserAPI.new(self)
      end
    end

    # UserAPI Class
    class UserAPI
      def initialize(s)
        @session = s
      end

      def list(options = {})
        defaults = {}
        query = defaults.merge(options)
        @session.get('/api/users', query)
      end

      def get(user_id = '')
        query = {}
        @session.get('/app/user/' + user_id, query)
      end

      def add(username, firstname, lastname, email, options = {})
        query = { UserName: username, FirstName: firstname, LastName: lastname, EmailAddress: email }
        query = query.merge(options)
        @session.post('/app/user', query)
      end

      def edit(id, attributes)
        @session.post('/app/user/edit', UserId: id, Attributes: attributes.to_json)
      end

      def required_params
        @auth
      end
    end
  end
end
