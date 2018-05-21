class Language < ApplicationRecord
  has_many :language_skills
  has_many :users, through: :language_skills

  validates :name, presence: true, uniqueness: true

end
