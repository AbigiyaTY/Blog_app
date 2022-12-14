require 'rails_helper'

RSpec.describe LikesController, type: :request do
  describe 'GET/index' do
    it 'index for likes works!' do
      get likes_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Likes')
      expect(response).to render_template(:index)
    end
  end

  describe 'likes#show' do
    it 'show for likes works!' do
      get '/users/1/posts/1/likes/1'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Likes')
      expect(response).to render_template(:show)
    end
  end
end
