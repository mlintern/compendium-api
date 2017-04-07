# encoding: utf-8
# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Workflow Stage Unit Tests
class WorkflowStage < UnitTests
  def test_workflow_stage_list
    req = @admin.stage.list
    assert req.code == 200
  end
end
