require 'rails_helper'

feature 'user logged in' do
  scenario 'can see list of their repositories' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/repository'

    expect(page).to have_css('.repository', count: 30)
    expect(page).to have_content("List of repositories :")

    within(first('.repository')) do
      expect(page).to have_content('1804')
    end

  end
end
