require 'rails_helper'

RSpec.describe Token, type: :model do
  it 'happy way' do
    token = build(:token, access_token: 'x', refresh_token: 'y', expires_at: DateTime.now)
    expect(token).to be_valid
  end
end
