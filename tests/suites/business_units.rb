# encoding: utf-8
# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# API Unit Tests
class BusinessUnits < UnitTests
  def test_bu_list
    req = @admin.bu.list
    assert req.code == 200
  end
end
