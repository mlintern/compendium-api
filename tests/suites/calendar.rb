# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Calendar Unit Tests
class Calendar < UnitTests
  def test_calendar_events
    start_date = Time.now.utc
    end_date = (start_date + (7 * 24 * 60 * 60)).iso8601
    req = @admin.calendar.events(start_date, end_date)
    assert req.code == 200
  end
end
