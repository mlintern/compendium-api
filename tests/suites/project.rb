# encoding: utf-8
# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Project Unit Tests
class Project < UnitTests
  def test_project_list
    req = @admin.project.list
    assert req.code == 200
  end
end
