class AvatarsController < ApplicationController
  def show
  end

  def create
    current_user.update(user_params)
    if current_user.valid?
      render :show
    else
      flash[:danger] = current_user.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :avatar_cache)
  end
end
