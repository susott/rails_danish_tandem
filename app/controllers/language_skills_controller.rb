class LanguageSkillsController < ApplicationController
  def create
    @language_skills = LanguageSkill.new(score: params.dig(:user, :language_skill_ids))
    @language_skills.language = Language.find(params.dig(:user, :language_ids)[1])
    @language_skills.user = current_user
    @language_skills.save
    redirect_to dashboard_path
  end
end
