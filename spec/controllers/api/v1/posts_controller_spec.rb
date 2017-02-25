require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:user_attrs) { attributes_for(:user) }
  let!(:user) { create(:user) }

  before do
    @auth_token = AuthenticateUser.call(user_attrs[:email], user_attrs[:password]).result
  end

  describe 'auth token' do
    context 'when request without auth token' do
      it 'should return the missing token error' do
        post :create, params: { title: 'title1111', body: 'body1111', published_at: Time.now.utc.to_s }

        expect(response.body).to include('[{"code":"missing_token"')
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when request with invalid auth token' do
      it 'should return error' do
        post :create, params: { title: 'title1111', body: 'body1111', published_at: Time.now.utc.to_s, auth_token: '11111' }

        expect(response.body).to include('[{"code":"invalid_token"')
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'POST #create' do
    it 'creates post successfully' do
      params = { title: 'title111', body: 'body1111', published_at: Time.now.utc.to_s, auth_token: @auth_token }
      post :create, params: params

      parsed_response = JSON.parse(response.body)
      expect(parsed_response['title']).to eq params[:title]
      expect(parsed_response['body']).to eq params[:body]
      expect(parsed_response['author_nickname']).to eq user.nickname

      post_id = parsed_response['id'].to_i
      post = Post.find(post_id)
      expect(post.title).to eq params[:title]
      expect(post.body).to eq params[:body]
      expect(post.published_at.utc.to_s).to eq params[:published_at]
      expect(post.user_id).to eq user.id
    end

    context 'when published_at is absent' do
      it 'fills published_at in the table by current time' do
        post :create, params: { title: 'title1111', body: 'body1111', auth_token: @auth_token }

        item = Post.first
        expect(item.published_at).to be_truthy
      end
    end

    context 'when any field is absent' do
      it 'throws an error in the result' do
        post :create, params: { body: 'body1111', published_at: Time.now.utc.to_s, auth_token: @auth_token }

        expect(response).to have_http_status(:forbidden)
        expect(response.body).to include('[{"code":"post_create_failed"')
      end
    end
  end

  describe do
    before do
      @items = []
      @items << user.posts.create(title: 'title1', body: 'body1', published_at: Time.now.utc)
      @items << user.posts.create(title: 'title2', body: 'body2', published_at: Time.now.utc)
      @items << user.posts.create(title: 'title3', body: 'body3', published_at: Time.now.utc)
      @items << user.posts.create(title: 'title4', body: 'body4', published_at: Time.now.utc)
      @items << user.posts.create(title: 'title5', body: 'body5', published_at: Time.now.utc)
    end

    describe 'GET #show' do
      context 'get valid element' do
        it do
          get :show, params: { id: @items[3].id, auth_token: @auth_token }

          expect(JSON.parse(response.body)['id'].to_i).to eq @items[3].id
        end
      end

      context 'try to get element out of the element list' do
        it do
          get :show, params: { id: @items.count + 1, auth_token: @auth_token }

          expect(response.body).to include('[{"code":"not_found",')
          expect(response).to have_http_status(:not_found)
        end
      end
    end

    describe 'GET #index' do
      it 'should take valid page' do
        get :index, params: { page: 2, per_page: 2, auth_token: @auth_token }

        result_ids = JSON.parse(response.body).map { |item| item['id'].to_i }
        check_ids = Post.order(published_at: :desc).offset(2).limit(2).all
        expect(result_ids).to contain_exactly(check_ids[0].id, check_ids[1].id)
        expect(response.headers['Full-Page-Count']).to eq 3
        expect(response.headers['Full-Record-Count']).to eq @items.count

        get :index, params: { page: 2, per_page: 3, auth_token: @auth_token }

        result_ids = JSON.parse(response.body).map { |item| item['id'].to_i }
        check_ids = Post.order(published_at: :desc).offset(3).limit(3).all
        expect(result_ids.length).to eq 2
        expect(result_ids).to contain_exactly(check_ids[0].id, check_ids[1].id)
        expect(response.headers['Full-Page-Count']).to eq 2
        expect(response.headers['Full-Record-Count']).to eq @items.count
      end
    end
  end
end
