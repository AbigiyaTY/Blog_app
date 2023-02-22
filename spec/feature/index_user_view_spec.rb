require 'rails_helper'

RSpec.describe 'User features', type: :system do
  subject do
    @user = User.create(
      name: 'Lilly',
      posts_counter: 3,
      bio: 'web developer',
      photo: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80'
    )
  end

  describe 'User Index page', js: true do
    it 'displays the username of all other users.' do
      visit users_path(subject)
      expect(page).to have_content('Lilly')
    end

    it 'displays the the profile picture for each user.' do
      visit users_path(subject)
      page.has_content?('Screenshot Image')
      expect(page).to have_css('img')
    end

    it 'display the user bio' do
      visit users_path(subject)
      page.has_content?(@user.bio.to_s)
    end

    it 'When I click on a user, I am redirected to that user show page.' do
      visit users_path(@user)
      expect(current_path).to eq(users_path(@user))
    end
  end
end
