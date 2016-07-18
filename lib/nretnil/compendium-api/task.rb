# encoding: utf-8
# frozen_string_literal: true
module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def task
        TaskAPI.new(self)
      end
    end

    # TaskAPI Class
    class TaskAPI
      def initialize(s)
        @session = s
      end

      def get_post_tasks(post_id)
        @session.get('/api/posts/' + post_id + '/post_tasks')
      end

      def get_current_task(post_id)
        result = get_post_tasks(post_id)
        current = { 'info' => 'All tasks are completed.' }
        result['tasks'].each do |task|
          current = task if task['current']
        end
        current
      end

      def my_current_tasks
        @session.get('/api/post_tasks/my_tasks/current')
      end

      def complete(task_id)
        body = { completed: true }
        @session.put('/api/post_tasks/' + task_id + '/completed', body.to_json)
      end

      def uncomplete(task_id)
        body = { completed: false }
        @session.put('/api/post_tasks/' + task_id + '/completed', body.to_json)
      end

      def required_params
        @auth
      end
    end
  end
end
