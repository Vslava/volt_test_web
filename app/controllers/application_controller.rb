class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorize

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_path unless current_user
  end
end
