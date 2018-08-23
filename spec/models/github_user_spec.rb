require 'rails_helper'

describe GithubUser do
  it 'exists' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    github_user = GithubUser.new(user)

    expect(github_user).to be_a(GithubUser)
  end

end
