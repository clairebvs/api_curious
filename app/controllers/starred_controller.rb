class StarredController < ApplicationController
  def index
    @starred_repositories = GithubUser.new(current_user).starred_repositories
  end
end
