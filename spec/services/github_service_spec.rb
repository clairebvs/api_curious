require 'rails_helper'

describe GithubService do
  it 'exists' do
    # VCR.use_cassette("github_service.user_repositories") do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      github_service = GithubService.new(user)

      expect(github_service).to be_a(GithubService)
    # end
  end

  context "instance methods" do
    context "#user_repositories" do
      it 'returns repositories for a user from api call' do
        # VCR.use_cassette("github_service.user_repositories") do
          user = create(:user)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          github_service = GithubService.new(user)
          # require "pry"; binding.pry

          repo = github_service.user_repositories.first
          expect(github_service.user_repositories.count).to eq(30)
          expect(repo).to have_key(:name)
          expect(repo).to have_key(:id)
        # end
      end
    end
    context "#user_starred_repositories" do
      it 'returns starred repositories for a user from api call' do
        # VCR.use_cassette("github_service.user_repositories") do
          user = create(:user)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          github_service = GithubService.new(user)
          # require "pry"; binding.pry

          repo = github_service.user_starred_repositories.first
          expect(github_service.user_starred_repositories.count).to eq(2)
          expect(repo).to have_key(:name)
          expect(repo).to have_key(:id)
        # end
      end
    end
  end
end
