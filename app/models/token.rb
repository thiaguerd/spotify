class Token < ApplicationRecord
  has_one :user, dependent: :destroy

  def self.build(options)
    Token.create({
                   access_token: options[:access_token],
                   refresh_token: options[:refresh_token],
                   expires_at: DateTime.now + options[:expires_in].seconds
                 })
  end
end
