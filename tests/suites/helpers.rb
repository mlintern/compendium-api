# encoding: utf-8
# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# APP Unit Tests
class Helpers < UnitTests
  def test_helper_user_id
    req = @admin.helper.user_id
    puts req
    assert req.uuid?
  end
end
