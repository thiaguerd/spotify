require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'GET /in' do
    it 'returns http success' do
      get '/session/in'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /out' do
    it 'returns http redirect to root_path' do
      get '/session/out'
      expect(response).to redirect_to(root_path)
    end
  end
end
