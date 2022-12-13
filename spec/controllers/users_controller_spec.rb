require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      get users_url
      expect(response).to be_successful
    end
  end

  describe 'users#show' do
    it 'show for users works!' do
      get '/users/1'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Teacher from Mexico.')
    end
  end
end
