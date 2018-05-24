class ProfilesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(profile_update_params)
    # render :my_dashboard
    redirect_to('/me')
  end

  def my_dashboard
    @user = current_user
  end

  def profile_update_params
    params.require(:user).permit(:photo, :photo_background)
  end
end
