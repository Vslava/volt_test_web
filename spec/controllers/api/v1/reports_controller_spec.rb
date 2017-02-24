require 'rails_helper'

RSpec.describe Api::V1::ReportsController, type: :controller do

  before do
    user_attrs = attributes_for(:user)
    create(:user, user_attrs)

    @auth_token = AuthenticateUser.call(user_attrs[:email], user_attrs[:password]).result
  end

  describe 'POST #by_author' do
    it 'should invoke report job' do
      params = {
        start_date: '2017-01-01 00:00:00',
        end_date: '2017-05-01 23:59:59',
        email: 'aaaa@aaa',
        auth_token: @auth_token
      }

      expect(ReportGeneratorJob).to receive(:perform_later).with(
        params[:start_date],
        params[:end_date],
        params[:email]
      )

      post :by_author, params: params

      expect(response.body).to include('{"message":"Report generation started"}')
    end
  end
end
