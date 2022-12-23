require 'rails_helper'

RSpec.describe 'Post index page', type: :system do
  describe 'testing for user post index page', js: true do
    it 'display the title of the post' do
      visit('/users/1/posts/1')
      expect(page).to have_content('What is the role of women in technology?')
    end

    it 'displays the user profile picture.' do
      visit('/users/1/posts/1')
      expect(page).to have_content('Lilly')
    end

    it 'I can see how many comments a post has.' do
      visit('/users/1/posts/1')
      expect(page).to have_content('Comments counter: 1')
    end

    it 'I can see how many likes a post has.' do
      visit('/users/1/posts/1')
      expect(page).to have_content('Likes counter: 1')
    end

    it 'I can see some of the post body' do
      visit('/users/1/posts/1')
      expect(page).to have_content('Title: What is the role of women in technology?')
    end

    it 'I can see the username of each commentor.' do
      visit('/users/1/posts/1')
      expect(page).to have_content('Lilly')
    end

    it 'I can see the comment each commentor left.' do
      visit('/users/1/posts/1')
      page.has_content?('Lilly: This post really gives ideas what women role in tech.')
    end
  end
end
