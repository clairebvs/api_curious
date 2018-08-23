class User < ApplicationRecord
  def self.create_with_omniauth(user_info)
    create! do |user|
      user.provider = user_info["provider"]
      user.uid = user_info["uid"]
      user.username = user_info["info"]["name"]
      user.image = user_info["info"]["image"]
      user.nickname = user_info["info"]["nickname"]
      user.oauth_token = user_info["credentials"]["token"]
      user.avatar_url = user_info["info"]["avatar_url"]
      user.followers = user_info["info"]["followers"]
      user.following = user_info["info"]["following"]
    end
  end
end
