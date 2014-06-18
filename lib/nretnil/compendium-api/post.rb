module Nretnil
  module CompendiumAPI

    class Compendium

      def list_posts(page, search = nil, status = nil)
        query = { :Count => 100, :Page => page }
        unless status.nil?
          query[:Status] = status.to_json
        end
        unless search.nil?
          query[:SearchTerms] = search
        end
        response = Compendium.get('/app/posts', :basic_auth => @auth, :query => query )
      end

      def get_post(postid)
        response = Compendium.get('/app/post/' + postid, :basic_auth => @auth )
      end

      def add_post(title,body,url,publish_date,draft,optional)
        query = { :Title => title, :Body => body, :Slug => url, :PublishDate => publish_date, :Draft => draft }
        query += optional
        response = Compendium.post('/app/post', :basic_auth => @auth, :body => query)
      end

      def update_post(post_id,title,body,url,publish_date,draft,optional)
        query = { :PostId => post_id, :Title => title, :Body => body, :PublishDate => publish_date, :Draft => draft }
        query += optional
        response = Compendium.post('/app/post', :basic_auth => @auth, :body => query)
      end

      def delete_post(postid)
        response = Compendium.delete('/app/post/' + postid, :basic_auth => @auth )
      end

      def approve_posts(post_ids)
        request = []
        post_ids.each do |post_id|
          request << { "PostId" => post_id, "Operation" => "approve", "Notify" => "false", "Ping" => "false" }
        end
        response = Compendium.post('/app/posts/moderate', :basic_auth => @auth, :body => {:Posts => request.to_json } )
      end

      def decline_posts(post_ids)
        request = []
        post_ids.each do |post_id|
          request << { "PostId" => post_id, "Operation" => "decline", "Notify" => "false", "Ping" => "false" }
        end
        response = Compendium.post('/app/posts/moderate', :basic_auth => @auth, :body => {:Posts => request.to_json } )
      end

    end

  end
end