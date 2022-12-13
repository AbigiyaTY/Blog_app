require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    let(:comment) { Comment.create(author_id: 1, post_id: 1, text: 'This is a comment') }

        it 'It should response status was correct' do
            get :index
            expect(response).to have_http_status(:success)
        end

        it 'It should response status was correct' do
            get :show, params: { id: comment.id }
            expect(response).to have_http_status(:success)
        end

        it 'It should response status was correct' do
            get :new
            expect(response).to have_http_status(:success)
        end

        it 'It should response status was correct' do
            get :edit, params: { id: comment.id }
            expect(response).to have_http_status(:success)
        end

        it 'It should response status was correct' do
            post :create, params: { comment: { author_id: 1, post_id: 1, text: 'This is a comment' } }
            expect(response).to have_http_status(:found)
        end

        it 'It should response status was correct' do
            put :update, params: { id: comment.id, comment: { author_id: 1, post_id: 1, text: 'This is a comment' } }
            expect(response).to have_http_status(:found)
        end

        it 'It should response status was correct' do
            delete :destroy, params: { id: comment.id }
            expect(response).to have_http_status(:found)
        end

end
