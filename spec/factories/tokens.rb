FactoryBot.define do
  factory :token do
    access_token { "MyString" }
    refresh_token { "MyString" }
    expires_at { "MyString" }
  end
end
