class User < ApplicationRecord
  belongs_to :token

  def self.build(token)
    user_data = Spotify::Api::Me.me(token)
    user = find_by(uid: user_data[:id])
    return user if user

    create_from_me(user_data, token)
  end

  class << self
    private

    def create_from_me(user_data, token)
      create({
               uid: user_data[:id],
               name: user_data[:display_name],
               external_url: user_data[:external_urls][:spotify],
               image_url: user_data[:images][0][:url],
               email: user_data[:email],
               token: token
             })
    end
  end
end
