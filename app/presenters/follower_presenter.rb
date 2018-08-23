class FollowerPresenter
  def initialize(current_user)
    @git_service = GithubService.new(current_user)
  end

  def followers
    @git_service.user_followers.map do |follower_data|
      Follower.new(follower_data)
    end
  end
end
