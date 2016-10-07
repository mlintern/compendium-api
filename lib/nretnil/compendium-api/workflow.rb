# encoding: utf-8
# frozen_string_literal: true
module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def workflow
        WorkflowAPI.new(self)
      end

      def stage
        WorkflowStageAPI.new(self)
      end

      def task
        WorkflowTaskAPI.new(self)
      end
    end

    # WorklfowAPI Class
    class WorkflowAPI
      def initialize(s)
        @session = s
      end

      def list(options = {})
        query = { active_only: true }.merge(options)
        @session.get('/api/workflows', query)
      end

      def get(id)
        @session.get('/api/workflows/' + id)
      end

      def add(workflow_name, options = {})
        body = { name: workflow_name, required_all: false, priority: 10 }.merge(options)
        @session.post('/api/workflows', body.to_json)
      end

      def edit(id, options = {})
        @session.put('/api/workflows/' + id, options.to_json)
      end

      def required_params
        @auth
      end
    end

    # WorkflowStageAPI
    class WorkflowStageAPI
      def initialize(s)
        @session = s
      end

      def list(options = {})
        query = { active_only: true }.merge(options)
        @session.get('/api/workflow_stages', query)
      end

      def add(stage_name, options = {})
        body = { name: stage_name, color: '00FF00', stage_type: 'prepublication' }.merge(options)
        @session.post('/api/workflow_stages', body.to_json)
      end

      def edit(stage_id, options = {})
        @session.put('/api/workflow_stages/' + stage_id, options.to_json)
      end

      def delete(stage_id, options = {})
        @session.delete('/api/workflow_stages/' + stage_id, options.to_json)
      end

      def required_params
        @auth
      end
    end

    # WorkflowTaskAPI
    class WorkflowTaskAPI
      def initialize(s)
        @session = s
      end

      def list(workflow_id, options = {})
        query = { active_only: true }.merge(options)
        @session.get('/api/workflows/' + workflow_id + '/workflow_tasks', query)
      end

      def add(workflow_id, task_name, stage_id, options = {})
        body = { stage: { id: stage_id }, description: task_name, edit_policy: 'once', task_type: 'approve', assignees: [{ assignee_type: 'author' }] }.merge(options)
        @session.post('/api/workflows/' + workflow_id + '/workflow_tasks', body.to_json)
      end

      def edit(workflow_id, task_id, options = {})
        @session.put('/api/workflows/' + workflow_id + '/workflow_tasks/' + task_id, options.to_json)
      end

      def delete(workflow_id, task_id, options = {})
        @session.delete('/api/workflows/' + workflow_id + '/workflow_tasks/' + task_id, options.to_json)
      end

      def required_params
        @auth
      end
    end
  end
end