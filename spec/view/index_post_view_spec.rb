require 'rails_helper'

RSpec.describe 'Post index page', type: :system do
    describe 'testing for user post index page', js: true do

        it 'displays the profile picture for each user.' do
            visit ('/users/1/posts')
            page.has_content?('Screenshot Image')
            expect(page).to have_css('img')
        end

        it 'displays the user profile picture.' do
            visit ('/users/1/posts')
            expect(page).to have_content('Lilly')
        end

        it 'display the number of posts each user has written.' do
            visit ('/users/1/posts')
            expect(page).to have_content('3')
        end

        it 'display the title of the post' do
            visit ('/users/1/posts')
            expect(page).to have_content('Algorithm')
        end

        it 'I can see some of the post body' do
            visit ('/users/1/posts')
            expect(page).to have_content('An algorithm is a set of instructions for solving a problem or accomplishing a task. One commonexample of an algorithm is a recipe, which consists of specific instructions for preparing a dish or meal. a process or set of rules to be followed in calculations or other problem-solving operations,especially by a computer.')
        end

        it 'I can see the first comments on a post' do
            visit ('/users/1/posts')
            expect(page).to have_content('Title: What is the role of women in technology?')
        end

        it 'I can see how many comments a post has.' do
            visit ('/users/1/posts')
            expect(page).to have_content('Comments counter: 1')
        end

        it 'I can see how many likes a post has.' do
            visit ('/users/1/posts')
            expect(page).to have_content('Likes counter: 2')
        end


    end
end