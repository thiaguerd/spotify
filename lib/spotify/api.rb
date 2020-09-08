module Spotify
  class Api
    def self.url_in(request)
      url = Rails.configuration.spotify[:login]
      url.gsub!('client_id?', Rails.configuration.spotify[:client_id])
      url.gsub!('redirect_uri?', redirect_uri(request: request))
    end

    class << self
      private

      def redirect_uri(options = {})
        request = options[:request]
        uri = request.protocol + request.host_with_port
        uri + Rails.configuration.spotify[:callback]
      end
    end
  end
end
