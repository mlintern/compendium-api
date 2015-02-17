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
        response = { "stats" => { "total" => 1 }}
        page = 1
        while response["stats"]["total"] > @content.length
          list_options = { :Count => '100', :Page => page }.merge(@options)
          response = list(list_options)
          @content += response["content"]
          page += 1
        end
        { 'stats' => { 'total' => @content.length } , 'content' => @content }
      end

      def get(post_id)
        query = {}
        response = @session.get( '/api/posts/' + post_id, query )
      end

      def add(user_id,title,body,content_type_id,options = {})
        manditory = { :author_id => user_id, :title => title, :body => body, :content_type_id => content_type_id }
        query = manditory.merge(options)
        response = @session.post( '/api/posts', query.to_json )
      end

      def idea(title,options = {})
        manditory = { :post_title => title }
        query = manditory.merge(options)
        response = @session.post( '/api/posts', query.to_json )
      end

      def update(post_id,options)
        query = options
        response = @session.put( '/api/posts/' + post_id, query.to_json )
      end

      def approve(post_ids = [],force = false)
        response = @session.info('This Endpoint has been depreciated as of the New Workflow System.')
      end

      def force_live(content_id)
        content = get(content_id)
        publish_date = Time.now
        options = { :import_live => true, :import_from => "compendium-api gem", :network_id => content["network_id"], :publish_date => publish_date, :post_publication => { :remote_id => nil, :publish_stamp => publish_date, :remote_url => nil, :remote_state => nil, :state => 'published' } }
        response = update(content_id,options)
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