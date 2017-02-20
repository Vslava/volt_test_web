require 'rails_helper'

RSpec.describe Api::V1::AuthenticationController, type: :controller do
  let(:user_attrs) { attributes_for(:user) }
  let!(:user) { create(:user) }

  it 'authenticates the user successfully' do
    post :authenticate, params: { email: user_attrs[:email], password: user_attrs[:password] }

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status(:ok)
    expect(response.body).to include('{"auth_token":"')
  end

  context 'password is invalid' do
    it 'cannot authenticates the user' do
      post :authenticate, params: { email: user_attrs[:email], password: '' }

      expect(response.content_type).to eq "application/json"
      expect(response).to have_http_status(:not_found)
      expect(response.body).to include('{"errors":[{"code":"invalid_credentials"')
    end
  end
end
