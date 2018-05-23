class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :language_skills, dependent: :destroy
  has_many :languages, -> { distinct }, through: :language_skills
  has_many :prefered_meeting_times, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :city, presence: true
  validates :description, presence: true, length: { minimum: 50 }
  validates :dedication, presence: true, inclusion: { in: ["occassionally", "once per month", "once per week", "more often"] }
  validates :gender, presence: true, inclusion: { in: ["female", "male", "other"] }
  validates :age, numericality: { only_integer: true, greater_than: 0, less_than: 110 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
