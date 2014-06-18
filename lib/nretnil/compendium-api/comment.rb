module Nretnil
  module CompendiumAPI

    class Compendium

      def list_comments(count)
        query = { :Count => count }
        response = Compendium.get('/app/comments', :basic_auth => @auth, :query => query )
      end

      def approve_comments(comment_ids)
        request = []
        comment_ids.each do |comment_id|
          request << { "CommentId" => comment_id, "Operation" => "approve", "Notify" => "false"  }
        end
        response = Compendium.post('/app/comments/moderate', :basic_auth => @auth, :body => {:Comments => request.to_json } )
      end

      def decline_comments(comment_ids)
        request = []
        comment_ids.each do |comment_id|
          request << { "CommentId" => comment_id, "Operation" => "decline", "Notify" => "false"  }
        end
        response = Compendium.post('/app/comments/moderate', :basic_auth => @auth, :body => {:Comments => request.to_json } )
      end
    
    end

  end
end