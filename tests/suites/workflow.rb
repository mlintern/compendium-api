# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Workflow Unit Tests
class Workflow < UnitTests
  def test_workflow_list
    req = @admin.workflow.list
    assert req.code == 200
  end
end
