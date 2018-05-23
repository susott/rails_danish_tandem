class ProfilesController < ApplicationController
  def index
    # 1. language that have score 6 = finding native language
    # 2. find language that I am searching for
    # 3. look for users that speak that language natively
    # 4. find users that wanna learn my native language


    if params[:query].present?
      # if current_user.language_skills.exists?(language_id: 1, score: 6) # danish person
      #   @filtered_users = User.joins(languages: :language_skills)
      #       .where(languages: {name: params[:query]}).where('language_skills.score > 5')
      #   @users = @filtered_users.where(users: {city: current_user.city})
      # else
      #   @danish_natives = User.joins(languages: :language_skills)
      #       .where(languages: {name: "Danish"}).where('language_skills.score > 5')
      #   @language_learners = @danish_natives.joins(languages: :language_skills)
      #       #.where(languages: {name: params[:query]}).where('language_skills.score < 6')
      #   @users = @languages_learners.where(users: {city: current_user.city})
      #   raise
      # end

      ## working, more or less, without city
      @language_i_speak_natively = Language.joins(:language_skills)
          .where(language_skills: { score: 6, user_id: current_user.id}).first
      # add validation to have only one native language
      @language_i_wanna_speak = Language.find_by_name(params[:query])
      @users = @language_i_wanna_speak.users.joins(:language_skills)
          .where(language_skills: { score: 6 })
      # @users_wanna_learn = @users.joins(languages: :language_skills)
      #   .where("language_skills.score < 6 and language_skills.language_id = ?", @language_i_speak_natively.id).uniq

      ## these are working queries:
      # @user = User.joins(languages: :language_skills).where(languages: {name: "Italian"})
      # @user = User.joins(languages: :language_skills).where(languages: {name: "Italian"}).where('language_skills.score > 5')
      # @users = User.joins(languages: :language_skills).where(languages: {name: params[:query]})

    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def my_dashboard
    @user = current_user
  end
end
