require 'rails_helper'

describe GithubService do
  it 'exists' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    github_service = GithubService.new(user)

    expect(github_service).to be_a(GithubService)
  end

  context "instance methods" do
    context "#user_repositories" do
      it 'returns repositories for a user from api call', :vcr do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        github_service = GithubService.new(user)

        repo = github_service.user_repositories[:info].first
        expect(github_service.user_repositories.count).to eq(30)
        expect(repo).to have_key(:name)
        expect(repo).to have_key(:id)
      end
    end
  end
end
