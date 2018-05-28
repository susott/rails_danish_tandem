class ProfilesController < ApplicationController
  def index

  #### default fill for search fields
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
  ####

    if params[:native].present?
      # search for users, where params[:native] == current_users learning language
      # filter for users, where params[:learning] == current_users native language
      # filter for users around that city (10km?)
      @native_users = User.joins(languages: :language_skills)
            .where(languages: {name: params[:native]})
            .where('language_skills.score < 6')
      @learning_users = User.joins(languages: :language_skills)
            .where(languages: {name: params[:learning]})
            .where('language_skills.score = 6')
      #@users_nearby = User.near([current_user.latitude,current_user.longitude],20)
      @users_nearby = User.near(params[:city],20)
      @users = @native_users & @learning_users & @users_nearby

      # advanced search options

      # males = @users.where(gender: 'male') if params[:male]
      # females = @users.where(gender: 'female') if params[:female]
      # others = @users.where(gender: 'other') if params[:other]

      # array of hashes
      males = @users.select { |user| user.gender == "male"} if params[:male]
      females = @users.select { |user| user.gender == "female"} if params[:female]
      others = @users.select { |user| user.gender == "other"} if params[:other]

      if params[:male] || params[:female] || params[:other]
        @users = (males.to_a + females.to_a + others.to_a).uniq
      end






    else
      @users = User.all
    end

  #@users_geolocation = User.where.not(latitude: nil, longitude: nil)
    @users_have_geo = User.joins(languages: :language_skills)
          .where.not(latitude: nil, longitude: nil)
    @users_geolocation = @users_have_geo & @users

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
    define_profile
  end

  def update
    @user = User.find(params[:id])
    @user.update(profile_update_params)
    redirect_to('/my_dashboard')
  end

  def my_dashboard
    @user = current_user
    define_profile
  end

  def profile_update_params
    params.require(:user).permit(:photo, :photo_background)
  end

  private

  def define_profile
    @native_languages = @user.language_skills.where('score > 5').map(&:language)
    @learn_skills = @user.language_skills.where('score < 6')

    if @user.latitude
    @markers =
      [{
        lat: @user.latitude,
        lng: @user.longitude
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }]
    end
  end
end
