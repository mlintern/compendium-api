# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Content Type Unit Tests
class ContentType < UnitTests
  def test_content_type_list
    req = @admin.content_type.list
    assert req.code == 200
  end
end
