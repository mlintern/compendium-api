# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Comment Unit Tests
class Comment < UnitTests
  def test_comment_list
    req = @admin.comment.list
    assert req.code == 200
  end
end
