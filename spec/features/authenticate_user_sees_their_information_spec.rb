require "rails_helper"

feature 'user login in to their account' do
  scenario 'visit dashboard and sees information about their account' do
    create(:user)

    visit '/dashboard'

    expect(page).to have_content("Welcome")
    within (".informations") do
      expect(page).to have_content("Followers : ")
      expect(page).to have_content("Number of repos: ")
    end
  end
end
