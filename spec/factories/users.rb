FactoryBot.define do
  factory :user do |i|
    i.sequence(:uid) { |x| "MyString_#{x}" }
    i.sequence(:name) { |x| "MyString_#{x}" }
    i.sequence(:external_url) { |x| "MyString_#{x}" }
    i.sequence(:image_url) { |x| "https://www.img_#{x}.jpg" }
    i.sequence(:email) { |x| "MyString_#{x}" }
    token { create(:token) }
  end
end
