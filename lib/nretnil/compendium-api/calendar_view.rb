# frozen_string_literal: true

module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def calendar_view
        CalendarViewAPI.new(self)
      end
    end

    # CalendarViewAPI Class
    class CalendarViewAPI
      def initialize(s)
        @session = s
      end

      def list(options = {})
        @session.get('/api/calendar_views', options)
      end

      def assigned(options = {})
        @session.get('/api/calendar_views/assigned/views', options)
      end

      def get(id)
        @session.get('/api/calendar_views/' + id)
      end

      def add(name, options = {})
        manditory = { name: name }
        query = manditory.merge(options)
        @session.post('/api/calendar_views', query.to_json)
      end

      def edit(id, options)
        @session.put('/api/calendar_views/' + id, options.to_json)
      end

      def unassign(id)
        @session.put('/api/calendar_views/' + id + '/unassign', {}.to_json)
      end

      def delete(id)
        @session.delete('/api/calendar_views/' + id)
      end

      def required_params
        @auth
      end
    end
  end
end
