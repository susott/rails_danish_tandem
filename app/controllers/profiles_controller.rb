class ProfilesController < ApplicationController
  def index

    if params[:query].present?
      if current_user.native_dane
        @filtered_users = User.joins(languages: :language_skills)
            .where(languages: {name: params[:query]}).where('language_skills.score > 5')
        @users = @filtered_users.where(users: {address: current_user.address}).uniq
      else  # danish-learner
          @users = User.joins(languages: :language_skills).where(native_dane: true)
              .where(users: {address: current_user.address})
              .where(languages: {name: params[:query]}).uniq
      end

    else
      @users = User.all
    end
      ## working, more or less, without address

      # @language_i_speak_natively = Language.joins(:language_skills)
      #    .where(language_skills: { score: 6, user_id: current_user.id}).first
      # add validation to have only one native language
      # @language_i_wanna_speak = Language.find_by_name(params[:query])
      # @users = @language_i_wanna_speak.users.joins(:language_skills)
      #    .where(language_skills: { score: 6 })
      # @users_wanna_learn = @users.joins(languages: :language_skills)
      #   .where("language_skills.score < 6 and language_skills.language_id = ?", @language_i_speak_natively.id).uniq

      ## these are working queries:
      # @user = User.joins(languages: :language_skills).where(languages: {name: "Italian"})
      # @user = User.joins(languages: :language_skills).where(languages: {name: "Italian"}).where('language_skills.score > 5')
      # @users = User.joins(languages: :language_skills).where(languages: {name: params[:query]})

      @users_geolocation = User.where.not(latitude: nil, longitude: nil)

      @users = current_user ? User.where.not(id: current_user.id) : User.all

      @markers = @users_geolocation.map do |user|
        {
          lat: user.latitude,
          lng: user.longitude#,
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
    redirect_to('/my_dashboard')
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
