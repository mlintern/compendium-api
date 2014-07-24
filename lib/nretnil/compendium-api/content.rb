module Nretnil
  module CompendiumAPI

    class Compendium

      def content
        ContentAPI.new(self)
      end

    end

    class ContentAPI

      def initialize(s)
        @session = s
      end

      def list(options = {})
        defaults = { :Page => '1', :Count => '20' }
        query = defaults.merge(options)
        response = @session.get( '/api/posts', query )
      end

      def list_all(options = {})
        @content = []
        @options = options
        response = { "Statistics" => { "Total" => 1 }}
        page = 1
        while response["Statistics"]["Total"] > @content.length
          list_options = { :Count => '100', :Page => page }.merge(@options)
          response = list(list_options)
          @content += response["Success"]
          page += 1
        end
        { 'Success' => @content }
      end

      def get(post_id)
        query = {}
        response = @session.get( '/api/posts/' + post_id, query )
      end

      def add(title,body,slug,publish_date,options = {})
        manditory = { :description => title, :post_text => body, :url_lookup_token => slug, :publish_date => publish_date}
        query = manditory.merge(options)
        response = @session.post( '/api/posts', query )
      end

      def update(post_id,options = {})
        manditory = { :id => post_id }
        query = manditory.merge(options)
        response = @session.post( '/api/posts', query )
      end

      def approve(post_ids,force = false)
        request = []
        post_ids.each do |post_id|
          request << { "PostId" => post_id, "Operation" => "approve", "Notify" => "false", "Ping" => "false" }
        end
        response = @session.post( '/app/posts/moderate', {:Posts => request.to_json } )
      end

      def take_down(post_id)
        request = []
        response = @session.post( '/api/posts/' + post_id + '/takedown', {:Posts => request.to_json } )
      end

      def delete(post_id)
        response = @session.delete( '/api/posts/' + post_id )
      end

      def required_params
        @auth
      end

    end

  end
end