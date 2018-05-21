class LanguageSkill < ApplicationRecord
  belongs_to :user
  belongs_to :language

  validates :score, presence: true, inclusion: { in: 1..6 }
end
