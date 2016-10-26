# encoding: utf-8
# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Content Unit Tests
class Content < UnitTests
  def test_content_list
    req = @admin.content.list
    assert req.code == 200
  end
end
