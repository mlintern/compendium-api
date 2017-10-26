# frozen_string_literal: true

module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def calendar
        CalendarAPI.new(self)
      end
    end

    # CalendarAPI Class
    class CalendarAPI
      def initialize(s)
        @session = s
      end

      def events(start_date, end_date)
        range = "#{start_date},#{end_date}"
        query = { date_range: range }
        @session.get('/api/calendar_view_events', query)
      end

      def add(name, start_date, options = {})
        default = { start_date: start_date, name: name, all_day: false, icon: 'fa-calendar' }
        body = default.merge(options)
        @session.post('/api/calendar_items', body.to_json)
      end

      def delete(event_id)
        @session.delete('/api/calendar_items/' + event_id)
      end

      def required_params
        @auth
      end
    end
  end
end
