module Spotify
  module Api
    class Token
      include Spotify::Api

      def gen(options = {})
        http_post({
                    uri: token_uri,
                    head: build_head_token,
                    body: build_body_token(options).to_param
                  })
      end

      private

      def build_head_token
        auth = "#{client_id}:#{secret}"
        {
          Authorization: "Basic #{Base64.encode64(auth).delete("\n")}"
        }
      end

      def build_body_token(options)
        {
          grant_type: 'authorization_code',
          code: options[:code],
          redirect_uri: redirect_uri(options)
        }
      end
    end
  end
end
