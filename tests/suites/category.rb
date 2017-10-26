# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Category Unit Tests
class Category < UnitTests
  def test_category_list
    req = @admin.category.list
    assert req.code == 200
  end
end
