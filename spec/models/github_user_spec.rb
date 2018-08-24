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
        # data = {
        #         id: 141,
        #         node_id: "MDE",
        #         name: "1804"
        #         }
        # data2 = {
        #         id: 14,
        #         node_id: "E",
        #         name: "Mast"
        #         }

        github_user = GithubUser.new(user)
        # repo1 = Repository.new(data)
        # repo2 = Repository.new(data2)

        expect(github_user.repositories.count).to eq(30)
        expect(github_user.repositories.first).to be_a(Repository)
      end
    end
  end
end
