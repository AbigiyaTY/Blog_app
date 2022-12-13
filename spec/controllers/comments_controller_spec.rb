require 'rails_helper'

RSpec.describe CommentsController, type: :request do
    describe 'GET /index' do
        it 'works! (now write some real specs)' do
            get comments_path
            expect(response).to have_http_status(:ok)
            expect(response.body).to include('Comments')
        end
    end

    describe 'comments#show' do
        it 'works! (now write some real specs)' do
            get '/users/1/posts/1/comments/1'
            expect(response).to have_http_status(:ok)
            expect(response.body).to include('Hi Tom!')
        end
    end

end
