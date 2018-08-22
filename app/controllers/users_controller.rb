class UsersController < ApplicationController

  def new
  end

  def show
    conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = current_user.oauth_token
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/api/#{current_user.nickname}")

    @followers = JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
