require 'rails_helper'

feature 'user logged in' do
  scenario 'can see list of their repositories' do
    user = create(:user)

    # allow_any_instance_of(User).to receive(:current_user).and_return(user)
    visit '/repository'

    expect(page).to have_css('repository')
    expect(page).to have_content("List of repositories :")

  end
end
