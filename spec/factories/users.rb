FactoryBot.define do
  factory :user do
    provider {"github"}
    uid {"c.l"}
    username {"Claire B.L"}
    oauth_token {ENV['TEST_TOKEN']}
    image {"https://pic.com"}
    nickname {"clairebvs"}
  end
end
