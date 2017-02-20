class Api::V1::PostsController < Api::V1::ApplicationController
  def create
    post = @current_user.posts.create(post_params)
    if post.valid?
      render json: post
    else
      render json: ErrorResult.generate({ post_create_failed: post.errors.full_messages }),
             status: :forbidden
    end
  end

  def show
    render json: @current_user.posts.find(params[:id])
  end

  def index
    page, per_page = [params[:page].to_i, params[:per_page].to_i]

    records = @current_user.posts.order(published_at: :desc).page(page).per(per_page)

    response.headers['Full-Page-Count'] = records.total_pages
    response.headers['Full-Record-Count'] = records.total_count

    render json: records
  end

  private

  def post_params
    params.permit(:title, :body, :published_at)
  end
end
