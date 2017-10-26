# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Content Group Unit Tests
class ContentGroup < UnitTests
  def test_content_group_list
    req = @admin.content_group.list
    assert req.code == 200
  end
end
