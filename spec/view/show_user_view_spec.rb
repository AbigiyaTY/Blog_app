require 'rails_helper'
RSpec.describe 'User Show Page', type: :system do
    describe 'User show page', js: true do
        it 'displays the the profile picture for each user.' do
            visit ('users/1')
            page.has_content?('Screenshot Image')
            expect(page).to have_css('img')
        end
        it 'displays the user profile picture.' do
            visit ('users/1')
            expect(page).to have_content('Lilly')
        end
        it 'display the number of posts each user has written.' do
            visit ('users/1')
            expect(page).to have_content('3')
        end
        it 'display the user bio' do
            visit ('users/1')
            expect(page).to have_content('web developer')
        end
        it 'display the user first 3 posts' do
            visit ('users/1')
            expect(page).to have_content('What are 3 interesting facts about Mexico?')
            expect(page).to have_content('Algorithm')
            expect(page).to have_content('What is the role of women in technology?')
        end
        it 'display a button that lets me view all of a user posts.' do
            visit ('users/1')
            expect(page).to have_content('See all posts')
        end
        it 'When I click a users post, it redirects me to that post' do
            visit ('users/1')
            click_button('See all posts')
            expect(page).to have_current_path('/users/1/posts')
        end
        it 'it When I click a users post, it redirects me to that post' do
            visit ('users/1')
            click_button('See all posts')
            expect(page).to have_current_path('/users/1/posts')
        end
    end
end







