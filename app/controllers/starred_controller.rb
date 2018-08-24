class StarredController < ApplicationController

  def index
    @starred_repositories = GithubUser.new(current_user).starred_repositories

    conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{current_user.oauth_token}"
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/users/#{current_user.nickname}/starred")

    @starred_repositories = JSON.parse(response.body, symbolize_names: true).map do |repo|
      StarredRepository.new(repo)
    end
  end

end
