# encoding: utf-8
# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# BU Unit Tests
class BusinessUnit < UnitTests
  def test_bu_list
    req = @admin.bu.list
    assert req.code == 200
  end
end
