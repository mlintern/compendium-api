module Nretnil
  module CompendiumAPI

    class Compendium

      def callback
        CallbackAPI.new(self)
      end

    end

    class CallbackAPI

      def initialize(s)
        @session = s
      end

      def fire(name, arguments)
          query = { :EventName => name, :EventArgs => arguments }
          response = @session.post( '/app/callback/fire', query )
      end

      def required_params
        @auth
      end
    
    end

  end
end