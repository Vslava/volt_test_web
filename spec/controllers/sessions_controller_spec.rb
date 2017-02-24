require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  render_views

  describe 'GET #show' do
    it 'shows successfully' do
      get :show

      expect(response.body).to include("<strong>Please!</strong> Authorize yourself in the navigation bar")
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'has authorized successfully' do
      user_attrs = attributes_for(:user)
      user = create(:user, user_attrs)

      post :create, params: { email: user_attrs[:email], password: user_attrs[:password] }

      expect(session[:user_id]).to eq user.id
      expect(response).to redirect_to(root_path)
    end

    it 'has authorized unsuccessfully' do
      create(:user, { email: 'aaa@aaa', password: 'password1' })

      post :create, params: { email: 'bbb@bbb', password: 'other' }

      expect(session[:user_id]).to eq nil
      expect(response).to redirect_to(login_path)
    end
  end

  describe 'POST #destroy' do
    it 'closed the authorization' do
      session[:user_id] = 1

      post :destroy

      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(login_path)
    end
  end
end
