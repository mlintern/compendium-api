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

      def add_post(title,body,url,publish_date,draft = true,categories,publisher = nil,user_id = nil)
        query = { :UserId => user_id, :Title => title, :Body => body, :Slug => url, :PublishDate => publish_date, :Draft => draft }
        unless categories.empty?
          query[:BlogIds] = categories.to_json
        end
        unless post_id.nil?
          query[:PostId] = post_id
        end
        response = Compendium.post('/app/post', :basic_auth => @auth, :body => query)
      end

      def update_post(title,body,url,publish_date,draft = true,categories,publisher = nil,user_id = nil,post_id)
        query = { :PostId => post_id, :Title => title, :Body => body, :Draft => draft, :Notify => "false" }
        unless categories.empty?
          query[:BlogIds] = categories.to_json
        end
        unless publish_date.empty?
          query[:PublishDate] = publish_date
        end
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