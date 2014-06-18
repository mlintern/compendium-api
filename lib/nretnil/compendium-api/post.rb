module Nretnil
  module CompendiumAPI

    class Compendium

      def list_posts(options)
        defaults = { :Page => '1', :Count => '20', :'~Status' => ["deleted"].to_json }
        query = options.merge(defaults)
        response = Compendium.get('/api/posts', :basic_auth => @auth, :query => query, :verify => false )
      end

      def get_post(postid)
        response = Compendium.get('/api/posts/' + postid, :basic_auth => @auth, :verify => false )
      end

      def add_post(title,body,slug,publish_date,draft,options)
        manditory = { :Title => title, :Body => body, :Slug => slug, :PublishDate => publish_date, :Draft => draft }
        query = options.merge(manditory)
        response = Compendium.post('/app/post', :basic_auth => @auth, :body => query, :verify => false)
      end

      def update_post(post_id,options)
        manditory = { :PostId => post_id }
        query = options.merge(manditory)
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