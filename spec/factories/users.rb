FactoryBot.define do
  factory :user do
    provider
    uid
    username
    oauth_token ENV['TEST_TOKEN']
    image
    nickname "clairebvs"
  end
end
