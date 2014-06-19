module Nretnil
  module CompendiumAPI

    class CommentAPI

      def initialize(s)
        @session = s
      end

      def list(options)
        query = options
        response = @session.get( '/app/comments', query )
      end

      def add(post_id, body, time, name, email, url, options)
        data = { :Body => body, :CreatorIpAddress => ip, :CreatorUrl => url, :CreatorEmail => email, :CreatorName => name }
        manditory = { :PostId => post_id, :CommentDataFields => data.to_json, :CreationTimestamp => time }
        query = options.merge(manditory)
        response = @session.post( '/app/comment', query )
      end

      def approve(comment_ids)
        request = []
        comment_ids.each do |comment_id|
          request << { "CommentId" => comment_id, "Operation" => "approve", "Notify" => "false"  }
        end
        response = @session.post( '/app/comments/moderate', {:Comments => request.to_json } )
      end

      def decline(comment_ids)
        request = []
        comment_ids.each do |comment_id|
          request << { "CommentId" => comment_id, "Operation" => "decline", "Notify" => "false"  }
        end
        response = @session.post( '/app/comments/moderate', {:Comments => request.to_json } )
      end

      def required_params
        @auth
      end
    
    end

  end
end