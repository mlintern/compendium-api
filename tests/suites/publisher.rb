# encoding: utf-8
# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Publisher Unit Tests
class Publisher < UnitTests
  def test_publisher_list
    req = @admin.publisher.list
    assert req.code == 200
  end
end
