# encoding: utf-8
# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Post Task Unit Tests
class PostTask < UnitTests
  def test_post_task_list
    post = @admin.helper.first_live_post
    assert !post['id'].nil?
    req = @admin.post_task.list(post['id'])
    assert req.code == 200
  end
end
