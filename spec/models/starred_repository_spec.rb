require 'rails_helper'

describe StarredRepository do
  it 'find starred repositories data' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    json_response = File.open("./fixtures/starred_repos.json")

    WebMock.stub_request(:get, "https://api.github.com//users/user/starred").to_return(status: 200, body: json_response)

    starred_repository = StarredRepository.new(json_response)

    expect(repository.name).to eq('idea_box')
  end
end
