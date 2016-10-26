# encoding: utf-8
# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# API Unit Tests
class AppProviders < UnitTests
  def test_app_provider_list
    req = @admin.app_provider.list
    assert req.code == 200
  end

  def test_app_provider_get
    list = @admin.app_provider.list
    assert list.code == 200
    req = @admin.app_provider.get(list[0]['id'])
    assert req.code == 200
  end
end