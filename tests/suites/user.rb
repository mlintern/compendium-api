# encoding: utf-8
# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# User Unit Tests
class User < UnitTests
  def test_user_list
    req = @admin.user.list
    assert req.code == 200
  end
end
