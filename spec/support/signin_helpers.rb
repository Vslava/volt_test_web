module SigninHelpers
  def user_sign_in
    user = create(:user)
    session[:user_id] = user.id
  end
end
