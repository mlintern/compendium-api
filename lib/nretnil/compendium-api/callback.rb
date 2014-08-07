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

      def fire(name, arguments = {}, network_id = nil, schedule_at = nil)
          query = { :EventName => name, :EventArgs => arguments.to_json }
          if network_id
            query[:NetworkId] = network_id
          end
          if schedule_at
            query[:ScheduleAt] = schedule_at
          end
          response = @session.post( '/app/callback/fire', query )
      end

      def required_params
        @auth
      end
    
    end

  end
end