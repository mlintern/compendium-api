# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Workflow Task Unit Tests
class WorkflowTask < UnitTests
  def test_workflow_task_list
    workflow = @admin.workflow.list[0]
    assert !workflow['id'].nil?
    req = @admin.task.list(workflow['id'])
    assert req.code == 200
  end
end
