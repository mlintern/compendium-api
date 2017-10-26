# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Role Unit Tests
class Role < UnitTests
  def test_role_list
    req = @admin.role.list
    assert req.code == 200
  end
end
