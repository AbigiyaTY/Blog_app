require 'rails_helper'

RSpec.describe 'Post index page', type: :system do
  subject do
    @user = User.create(
      name: 'Lilly',
      posts_counter: 3,
      photo: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80'
    )

    @post1 = Post.create(
      author: @user,
      title: 'What is the role of African women in technology?',
      text: 'Women can bring a fresh approach and offer unique perspectives to meet challenges, solve problems, and design new products. They can also bring more women into the tech fold, and since technology often offers high salary opportunity, their presence in the industry can help reduce the overall gender pay gap.',
      comments_counter: 1,
      likes_counter: 2
    )

    @post2 = Post.create(
      author: @user,
      title: 'Algorithm',
      text: ' An algorithm is a set of instructions for solving a problem or accomplishing a task. One commonexample of an algorithm is a recipe, which consists of specific instructions for preparing a dish or meal. a process or set of rules to be followed in calculations or other problem-solving operations,especially by a computer.',
      comments_counter: 1,
      likes_counter: 2
    )

    @post3 = Post.create(
      author: @user,
      title: 'What is a web designer do?',
      text: 'Web designers plan, create and code internet sites and web pages, many of which combine text with sounds, pictures, graphics and video clips. A web designer is responsible for creating the design and layout of a website or web pages. It and can mean working on a brand new website or updating an already existing site.',
      comments_counter: 0,
      likes_counter: 1
    )

    @comment = Comment.create(
      post: @post1,
      author: @user,
      text: 'This post really gives ideas what women role in tech.'
    )
  end

  before { subject.save }

  describe 'testing for user post index page', js: true do
    it 'displays the profile picture for each user.' do
      visit user_posts_path('1')
      page.has_content?('Screenshot Image')
      expect(page).to have_css('img')
    end

    it 'displays the user profile picture.' do
      visit user_posts_path('1')
      expect(page).to have_content(@user.name)
    end

    it 'display the number of posts each user has written.' do
      visit user_posts_path('1')
      page.has_content?("Number of posts: #{@user.posts_counter}")
    end

    it 'display the title of the post' do
      visit user_posts_path('1')
      expect(page).to have_content(@post1.title.to_s)
    end

    it 'I can see some of the post body' do
      visit user_posts_path('1')
      expect(page).to have_content(@post1.text.to_s)
    end

    it 'I can see the first comments on a post' do
      visit user_posts_path('1')
      expect(page).to have_content('Title: What is the role of women in technology?')
    end

    it 'I can see how many comments a post has.' do
      visit user_posts_path('1')
      page.has_content?("Comments counter: #{@post1.comments_counter}")
    end

    it 'I can see how many likes a post has.' do
      visit user_posts_path('1')
      page.has_content?("Likes counter: #{@post1.likes_counter}")
    end

    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      visit('/users/1/posts')
      page.has_button?('Pagination')
    end

    it 'When I click on a post, it redirects me to that post show page.' do
      visit user_posts_path('1')
      click_on(@post1.title)
      expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
    end
  end
end
