require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { Post.create(title: 'Test post', comments_counter: 1, likes_counter: 20) }

  it 'should have a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'should have a valid length of title' do
    post.title = 'a' * 255
    expect(post).to_not be_valid
  end

  it 'comments counter should be intger' do
    post.comments_counter = 'a'
    expect(post).to_not be_valid
  end

  it 'should have a comments counter' do
    post.comments_counter = nil
    expect(post).to_not be_valid
  end

  it 'comments counter should be greater than or equal to 0' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'should have a likes counter' do
    post.likes_counter = nil
    expect(post).to_not be_valid
  end

  it 'likes counter should be intger' do
    post.likes_counter = 'a'
    expect(post).to_not be_valid
  end

  it 'likes counter should be greater than or equal to 0' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end
end
