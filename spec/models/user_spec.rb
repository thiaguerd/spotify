require 'rails_helper'

RSpec.describe User, type: :model do
  it 'happy way' do
    user = build(:user,
                 uid: 'x', name: 'y', external_url: 'c',
                 image_url: 'd', email: 'x', token: create(:token))
    expect(user).to be_valid
  end
end
