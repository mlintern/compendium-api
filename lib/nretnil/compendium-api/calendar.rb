module Nretnil
  module CompendiumAPI

    class Compendium

      def calendar
        CalendarAPI.new(self)
      end

    end

    class CalendarAPI

      def initialize(s)
        @session = s
      end

      def events(start_date, end_date)
          range = "#{start_date},#{end_date}"
          query = { :date_range => range }
          response = @session.get( '/api/calendar_events', query )
      end

      def add(name,start_date,options = {})
        default = { :start_date => start_date, :name => name, :all_day => false, :icon => "fa-calendar" }
        body = default.merge(options)
        response = @session.post( '/api/calendar_items', body.to_json )
      end

      def delete(event_id)
        response = @session.delete( '/api/calendar_items/' + event_id )
      end

      def required_params
        @auth
      end
    
    end

  end
end