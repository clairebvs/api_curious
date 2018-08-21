require 'open-uri'

class User < ApplicationRecord

  def self.create_with_omniauth(user_info)
    create! do |user|
      user.provider = user_info["provider"]
      user.uid = user_info["uid"]
      user.username = user_info["info"]["name"]
    end
  end

  def find_information
    doc = Nokogiri::HTML(open('https://github.com/username'))
  end
end
