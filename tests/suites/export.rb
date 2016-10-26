# encoding: utf-8
# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Export Unit Tests
class Export < UnitTests
  def test_export
    req = @admin.export
    assert req.code == 200
  end
end
