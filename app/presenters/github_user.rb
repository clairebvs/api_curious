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
    @github_service.user_starred_repositories.map do |starred_repo|
      StarredRepository.new(starred_repo)
    end
  end
end
