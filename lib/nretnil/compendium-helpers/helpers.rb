# encoding: utf-8
# frozen_string_literal: true
module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def helper
        HelperAPI.new(self)
      end
    end

    # HelperAPI Class
    class HelperAPI
      def initialize(s)
        @session = s
      end

      def slugify(title)
        URI.unescape(title).downcase.gsub(/[^a-z0-9 -]/, '').tr(' ', '-').gsub(/--/, '-').gsub(/--/, '-').gsub(/--/, '-')
      end

      def user_id
        users = @session.user.list
        users.each do |u|
          return u['user_id'] if u['username'] == @session.auth[:username]
        end
        nil
      end

      def first_live_post
        response = @session.content.list(Page: '1', Count: '1', Status: ['approved'].to_json)
        response['content'][0]
      end

      def network_id
        response = @session.content_type.list
        response[0]['network_id']
      end

      def pub_ids
        result = @session.publisher.list
        publishers = result
        ids = []
        publishers.each do |pub|
          ids << pub['id']
        end
        ids
      end

      def required_params
        @auth
      end
    end
  end
end
