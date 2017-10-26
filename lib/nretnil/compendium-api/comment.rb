# frozen_string_literal: true

module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def comment
        CommentAPI.new(self)
      end
    end

    # CommentAPI Class
    class CommentAPI
      def initialize(s)
        @session = s
      end

      def list(options = {})
        query = options
        @session.get('/app/comments', query)
      end

      def list_all(options = {}, debug = false)
        @comments = []
        @options = options
        response = list(Count: 1, Page: 1)
        puts response['Statistics'] if debug
        page = 1
        while (response['Statistics']['Total'] > @comments.length) && (page <= (response['Statistics']['Total'] / 100.to_f).ceil)
          list_options = { Count: '100', Page: page }.merge(@options)
          puts "Page: #{page}" if debug
          response = list(list_options)
          @comments += response['Success']
          page += 1
        end
        { 'Statistics' => response['Statistics'], 'Success' => @comments }
      end

      def get(comment_id)
        query = {}
        @session.get('/app/comment/' + comment_id, query)
      end

      def add(post_id, body, time, name, email, _url = nil, options = {})
        data = { Body: body, CreatorIpAddress: '8.8.8.8', CreatorUrl: 'http://the.compendium-api.gem', CreatorEmail: email, CreatorName: name }
        manditory = { PostId: post_id, CommentDataFields: data.to_json, CreationTimestamp: time }
        query = manditory.merge(options)
        @session.post('/app/comment', query)
      end

      def approve(comment_ids)
        request = []
        comment_ids.each do |comment_id|
          request << { 'CommentId' => comment_id, 'Operation' => 'approve', 'Notify' => 'false'  }
        end
        @session.post('/app/comments/moderate', Comments: request.to_json)
      end

      def decline(comment_ids)
        request = []
        comment_ids.each do |comment_id|
          request << { 'CommentId' => comment_id, 'Operation' => 'decline', 'Notify' => 'false'  }
        end
        @session.post('/app/comments/moderate', Comments: request.to_json)
      end

      def required_params
        @auth
      end
    end
  end
end
