class GithubUser

  def initialize(current_user)
    @current_user = current_user
    @github_service = GithubService.new(current_user)
  end

  def repositories
    @github_service.user_repositories.map do |user_repo|
      Repository.new(user_repo)
    end
  end

  def starred_repositories
    conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{@current_user.oauth_token}"
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/users/#{@current_user.nickname}/starred")

    @starred_repositories = JSON.parse(response.body, symbolize_names: true).map do |repo|
      StarredRepository.new(repo)
    end
  end
end
