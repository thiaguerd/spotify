module Spotify
  module Api
    class << self
      include Api
    end

    def self.url_in(request)
      url = login_uri.to_s
      url.gsub!('client_id?', client_id)
      url.gsub!('redirect_uri?', redirect_uri(request: request))
      url
    end

    private

    def http_post(options)
      request = Net::HTTP::Post.new(options[:uri], options[:head])
      request.body = options[:body] if options[:body]
      http = Net::HTTP.new(options[:uri].hostname, options[:uri].port)
      http.use_ssl = true
      response = http.request(request)
      JSON.parse(response.body).deep_symbolize_keys
    end

    def http_get(options)
      request = Net::HTTP::Get.new(options[:uri], options[:head])
      request.body = options[:body] if options[:body]
      http = Net::HTTP.new(options[:uri].hostname, options[:uri].port)
      http.use_ssl = true
      response = http.request(request)
      JSON.parse(response.body).deep_symbolize_keys
    end

    def client_id
      Rails.configuration.spotify[:app][:client_id]
    end

    def secret
      Rails.configuration.spotify[:app][:secret]
    end

    # URI
    def token_uri
      URI(Rails.configuration.spotify[:app][:url][:token_uri])
    end

    def login_uri
      URI(Rails.configuration.spotify[:app][:url][:login])
    end

    def me_uri
      URI(Rails.configuration.spotify[:app][:url][:me])
    end

    def redirect_uri(options = {})
      request = options[:request]
      uri = request.protocol + request.host_with_port
      uri + Rails.configuration.spotify[:app][:url][:callback]
    end
  end
end
