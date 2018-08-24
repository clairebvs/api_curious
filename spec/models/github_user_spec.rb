require 'rails_helper'

describe GithubUser do
  it 'exists' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    github_user = GithubUser.new(user)

    expect(github_user).to be_a(GithubUser)
  end

  context "instance methods" do
    context "#repositories" do
      it 'returns repositories for a user' do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        github_user = GithubUser.new(user)

        expect(github_user.repositories.count).to eq(30)
        expect(github_user.repositories.first).to be_a(Repository)
      end
    end
    context "#starred_repositories" do
      it 'returns starred repositories for a user' do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        github_user = GithubUser.new(user)

        expect(github_user.starred_repositories.count).to eq(2)
        expect(github_user.starred_repositories.first).to be_a(StarredRepository)
      end
    end
  end
end
