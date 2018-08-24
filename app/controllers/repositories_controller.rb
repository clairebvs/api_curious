class RepositoriesController < ApplicationController

  def index
    @repositories = GithubUser.new(current_user).repositories
  end
end
