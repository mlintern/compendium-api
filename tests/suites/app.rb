# encoding: utf-8
# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# API Unit Tests
class App < UnitTests
  def test_app_list
    req = @admin.app.list
    puts req.inspect
    assert req.code == 200
  end

  def test_app_get
    puts list = @admin.app.list
    assert list.code == 200
    req = @admin.app.get(list[0]['id'])
    assert req.code == 200
  end
end
