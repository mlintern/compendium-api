require 'rubygems'
require 'httparty'

module Nretnil
  module CompendiumAPI

    class Post
      include HTTParty
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

      def add_post(postid)
        response = Compendium.get('/app/post/' + postid, :basic_auth => @auth )
      end

      def udpate_post(postid)
        response = Compendium.get('/app/post/' + postid, :basic_auth => @auth )
      end
    end

  end
end