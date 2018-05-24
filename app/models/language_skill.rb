class LanguageSkill < ApplicationRecord
  belongs_to :user
  belongs_to :language

  validates :score, presence: true, inclusion: { in: 1..6 }
  after_save :set_user_native_dane

  def set_user_native_dane
    if language.name == "Danish" && score > 5
      user.native_dane = true
      user.save
    end
  end
end
