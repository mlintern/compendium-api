module Nretnil
  module CompendiumAPI

    class ContentAPI

      def initialize(s)
        @session = s
      end

      def list(options)
        defaults = { :Page => '1', :Count => '20', :'~Status' => ["deleted"].to_json }
        query = options.merge(defaults)
        response = @session.get( '/app/posts', query )
      end

      def get(post_id)
        query = {}
        response = @session.get( '/api/posts/' + post_id, query )
      end

      def add(title,body,slug,publish_date,draft,options)
        manditory = { :Title => title, :Body => body, :Slug => slug, :PublishDate => publish_date, :Draft => draft }
        query = options.merge(manditory)
        response = @session.post( '/app/post', query )
      end

      def update(post_id,options)
        manditory = { :PostId => post_id }
        query = options.merge(manditory)
        response = @session.post( '/app/post', query )
      end

      def approve(post_ids,force=false)
        request = []
        post_ids.each do |post_id|
          request << { "PostId" => post_id, "Operation" => "approve", "Notify" => "false", "Ping" => "false" }
        end
        response = @session.post( '/app/posts/moderate', {:Posts => request.to_json } )
      end

      def decline(post_ids)
        request = []
        post_ids.each do |post_id|
          request << { "PostId" => post_id, "Operation" => "decline", "Notify" => "false", "Ping" => "false" }
        end
        response = @session.post( '/app/posts/moderate', {:Posts => request.to_json } )
      end

      def delete(post_id)
        response = @session.delete( '/app/post/' + post_id )
      end

      def required_params
        @auth
      end

    end

  end
end