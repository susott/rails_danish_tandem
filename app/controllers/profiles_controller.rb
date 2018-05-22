class ProfilesController < ApplicationController
  def index
    if params[:query].present?
      # if current_user.language_skills.where("score < ?", 6) includes Danish
      # search for other languages

      # else
      # search for Danish speakers who want to learn your native languages
      # end
      if current_user.language_skills.where("score < ?", 6)


      native = current_user.language_skills.find_by(score: 6).language.name # array?
      learning = current_user.language_skills.where("score < ?", 6) # array?

      @users = User.joins(languages: :language_skills).where(languages: {name: "Danish"}).where(city: current_user.city).where("score < ?", 6)

      end

      # this is working:
      # @user = User.joins(languages: :language_skills).where(languages: {name: "Italian"})
      # @user = User.joins(languages: :language_skills).where(languages: {name: "Italian"}).where('language_skills.score > 3')
      # @users = User.joins(languages: :language_skills).where(languages: {name: params[:query]})

    else
      @users = User.all
    end
  end

  def show
    @user = current_user
  end
end
