require 'rails_helper'

RSpec.describe AvatarsController, type: :controller do
  render_views

  before do
    user_sign_in
  end

  describe 'GET #new' do
    subject { get :new }

    it 'behaves like new' do
      is_expected.to have_http_status(:ok)
      is_expected.to render_template('avatars/new')
    end
  end

  describe 'POST #create' do
    pending "add some examples to #{__FILE__}"
  end
end
