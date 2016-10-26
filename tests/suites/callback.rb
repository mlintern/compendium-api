# encoding: utf-8
# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# API Unit Tests
class Callback < UnitTests
  def test_callback_list
    puts req = @root.callback.list
    assert req.code == 200
  end
end
