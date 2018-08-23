class RepositoriesController < ApplicationController

  def index
    @repositories = GithubUser.new(current_user).repositories

    conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{current_user.oauth_token}"
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/users/#{current_user.nickname}/repos")

    @repositories = JSON.parse(response.body, symbolize_names: true).map do |repo|
      Repository.new(repo)
    end
  end
end
