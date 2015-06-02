module Nretnil
  module CompendiumAPI

    class Compendium

      def helper
        HelperAPI.new(self)
      end

    end

    class HelperAPI

      def initialize(s)
        @session = s
      end

      def slugify(title)
        slug = URI.unescape(title).downcase.gsub(/[^a-z0-9 -]/, '').gsub(/ /, '-').gsub(/--/, '-').gsub(/--/, '-').gsub(/--/, '-')
      end

      def user_id
        response = @session.user.get
        user = response["Success"]["UserId"]
      end

      def first_live_post
        response = @session.content.list({ :Page => '1', :Count => '1', :Status => ["approved"].to_json })
        post = response["content"][0]
      end

      def network_id
        response = @session.content_type.list
        network_id = response[0]["network_id"]
      end

      def pub_ids
        result = @session.publisher.list
        publishers = result
        ids = []
        publishers.each do |pub|
          ids << pub["id"]
        end
        return ids
      end

      def required_params
        @auth
      end

    end

  end
end