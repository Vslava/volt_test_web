class Api::V1::ApiController < ::ApiControllerBase
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :authenticate_request

  attr_reader :current_user

  private

  def record_not_found
    render json: ErrorResult.generate({ not_found: "The item hasn't been found" }), status: :not_found
  end

  def authenticate_request
    auth_result = AuthorizeApiRequest.call(params)

    if auth_result.success?
      @current_user = auth_result.result
    else
      render json: ErrorResult.generate(auth_result.errors), status: :unauthorized unless @current_user
    end
  end
end
