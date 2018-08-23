class UsersController < ApplicationController

  def new
  end

  def show
    # @github_user = FollowerPresenter.followers
    @github_user = FollowerPresenter.new(current_user)

    # conn = Faraday.new(url: "https://api.github.com") do |faraday|
    #   faraday.headers["Authorization"] = "token #{current_user.oauth_token}"
    #   faraday.adapter Faraday.default_adapter
    # end
    #
    # response = conn.get("/users/#{current_user.nickname}")
    #
    # @info = JSON.parse(response.body, symbolize_names: true)
  end
end
