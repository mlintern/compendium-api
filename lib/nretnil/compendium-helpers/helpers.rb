module Nretnil
  module CompendiumAPI

    class Helpers

      def slugify(title)
        slug = URI.unescape(title).downcase.gsub(/[^a-z0-9 -]/, '').gsub(/ /, '-').gsub(/--/, '-').gsub(/--/, '-').gsub(/--/, '-')
      end

    end

  end
end