# encoding: utf-8
# frozen_string_literal: true
module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def callback
        CallbackAPI.new(self)
      end
    end

    # CallbackAPI Class
    class CallbackAPI
      def initialize(s)
        @session = s
      end

      def fire(name, arguments = {}, network_id = nil, schedule_at = nil)
        query = { EventName: name, EventArgs: arguments.to_json }
        query[:NetworkId] = network_id if network_id
        query[:ScheduleAt] = schedule_at if schedule_at
        @session.post('/app/callback/fire', query)
      end

      def required_params
        @auth
      end
    end
  end
end
