# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Custom Field Unit Tests
class CustomField < UnitTests
  def test_custom_field_list
    req = @admin.custom_field.list
    assert req.code == 200
  end
end
