module Nretnil
  module CompendiumAPI

    class Compendium

      def list_posts(page, search = nil, status = nil)
        query = { :Count => 100, :Page => page, :Status => status.to_json, :SearchTerms => search }
        response = Compendium.get('/app/posts', :basic_auth => @auth, :query => query, :verify => false )
      end

      def get_post(postid)
        response = Compendium.get('/app/post/' + postid, :basic_auth => @auth, :verify => false )
      end

      def add_post(title,body,slug,publish_date,draft,options)
        query = { :Title => title, :Body => body, :Slug => slug, :PublishDate => publish_date, :Draft => draft }
        query = options.merge(query)
        response = Compendium.post('/app/post', :basic_auth => @auth, :body => query, :verify => false)
      end

      def update_post(post_id,options)
        query = { :PostId => post_id }
        query = options.merge(query)
        response = Compendium.post('/app/post', :basic_auth => @auth, :body => query)
      end

      def delete_post(postid)
        response = Compendium.delete('/app/post/' + postid, :basic_auth => @auth, :verify => false )
      end

      def approve_posts(post_ids)
        request = []
        post_ids.each do |post_id|
          request << { "PostId" => post_id, "Operation" => "approve", "Notify" => "false", "Ping" => "false" }
        end
        response = Compendium.post('/app/posts/moderate', :basic_auth => @auth, :body => {:Posts => request.to_json }, :verify => false )
      end

      def decline_posts(post_ids)
        request = []
        post_ids.each do |post_id|
          request << { "PostId" => post_id, "Operation" => "decline", "Notify" => "false", "Ping" => "false" }
        end
        response = Compendium.post('/app/posts/moderate', :basic_auth => @auth, :body => {:Posts => request.to_json }, :verify => false )
      end

    end

  end
end