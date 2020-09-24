module Spotify
  module Api
    class Me
      include Spotify::Api

      def self.me(token)
        new.me(token)
      end

      def me(token)
        http_get({ uri: me_uri, head: me_head(token) })
      end

      private

      def me_head(token)
        {
          Accept: 'application/json',
          'Content-Type': 'application/json',
          Authorization: "Bearer #{token.access_token}"
        }
      end
    end
  end
end
