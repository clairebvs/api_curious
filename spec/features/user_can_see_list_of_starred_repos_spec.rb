require 'rails_helper'

feature 'user logged in' do
  scenario 'can see list of their starred repos' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    json_response = File.open("./fixtures/starred_repos.json")

    WebMock.stub_request(:get, "https://api.github.com//users/user/starred").to_return(status: 200, body: json_response)

    visit '/starred'

    expect(page).to have_css('.starred_repo', count: 2)
    expect(page).to have_content("List of starred repositories :")

    within(first('.starred_repo')) do
      expect(page).to have_content('idea-box')
    end
  end
end
