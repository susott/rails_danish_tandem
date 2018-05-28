class ProfilesController < ApplicationController
  def index

    # default fill for search fields
    if params[:native].present?
      @native = params[:native]
    else
      @native = current_user.languages.first.name
    end

    if params[:learning].present?
      @learning = params[:learning]
    elsif current_user.languages.find_by('language_skills.score < 5')
      @learning = current_user.languages.find_by('language_skills.score < 5').name
    else
      @learning = ""
    end

    if params[:city].present?
      @city = params[:city]
    else
      @city = current_user.address
    end

    if params[:native].present?
      #@users = @filtered_users_2.where(users: {address: params[:city]).uniq

      @native_users = User.joins(languages: :language_skills)
            .where(languages: {name: params[:native]})
            .where('language_skills.score < 6')
      @learning_users = User.joins(languages: :language_skills)
            .where(languages: {name: params[:learning]})
            .where('language_skills.score = 6')
      #@users_nearby = User.near([current_user.latitude,current_user.longitude],20)
      @users_nearby = User.near(params[:city],20)
      @users = @native_users & @learning_users & @users_nearby

      # search for users, where params[:native] == current_users learning language
      # filter for users, where params[:learning] == current_users native language
      # filter for users around that city (10km?)

    else
      @users = User.all
    end

    @users_geolocation = User.where.not(latitude: nil, longitude: nil)
    @markers = @users_geolocation.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @user = User.find(params[:id])
    @native_languages = @user.language_skills.where('score > 5').map(&:language)
    @learn_skills = @user.language_skills.where('score < 6')
  end

  def update
    @user = User.find(params[:id])
    @user.update(profile_update_params)
    # render :my_dashboard
    redirect_to('/me')
  end

  def my_dashboard
    @user = current_user
    @native_languages = @user.language_skills.where('score > 5').map(&:language)
    @learn_skills = @user.language_skills.where('score < 6')
  end

  def profile_update_params
    params.require(:user).permit(:photo, :photo_background)
  end
end
