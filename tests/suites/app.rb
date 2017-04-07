# encoding: utf-8
# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# APP Unit Tests
class App < UnitTests
  def test_app_list
    req = @admin.app.list
    assert req.code == 200
  end
end
