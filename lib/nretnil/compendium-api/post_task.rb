# encoding: utf-8
# frozen_string_literal: true
module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def post_task
        PostTaskAPI.new(self)
      end
    end

    # PostTaskAPI
    class PostTaskAPI
      def initialize(s)
        @session = s
      end

      def list(post_id)
        @session.get('/api/posts/' + post_id + '/post_tasks')
      end

      def my_current_tasks
        @session.get('/api/post_tasks/my_tasks/current')
      end

      def get_current_task(post_id)
        result = get_post_tasks(post_id)
        current = { 'info' => 'All tasks are completed.' }
        result['tasks'].each do |task|
          current = task if task['current']
        end
        current
      end

      def add(title, post_id, stage_id, options = {})
        body = { assignees: [{ assignee_type: 'author' }], stage: stage_id, task_type: 'todo', description: title }.merge(options)
        @session.post('/api/posts/' + post_id + '/post_tasks', body.to_json)
      end

      def complete(task_id)
        body = { completed: true }
        @session.put('/api/post_tasks/' + task_id + '/completed', body.to_json)
      end

      def uncomplete(task_id)
        body = { completed: false }
        @session.put('/api/post_tasks/' + task_id + '/completed', body.to_json)
      end

      def delete(task_id)
        @session.delete('/api/post_tasks/' + task_id)
      end

      def required_params
        @auth
      end
    end
  end
end
