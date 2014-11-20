module Nretnil
  module CompendiumAPI

    class Compendium

      def task
        TaskAPI.new(self)
      end

    end

    class TaskAPI

      def initialize(s)
        @session = s
      end

      def get_post_tasks(post_id)
        response = @session.get( '/api/posts/'+ post_id +'/post_tasks')
      end

      def get_current_task(post_id)
        result = get_post_tasks(post_id)
        current = { 'info' => 'All tasks are completed.'}
        result['tasks'].each do |task|
          if task['current']
            current = task
          end
        end
        current
      end

      def my_current_tasks()
        response = @session.get( '/api/post_tasks/my_tasks/current')
      end

      def complete(task_id)
        body = { :completed => true }
        response = @session.put( '/api/post_tasks/'+ task_id +'/completed', body.to_json )
      end

      def uncomplete(task_id)
        body = { :completed => false }
        response = @session.put( '/api/post_tasks/'+ task_id +'/completed', body.to_json )
      end

      def required_params
        @auth
      end
    
    end

  end
end