class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :language_skills, dependent: :destroy
  has_many :languages, -> { distinct }, through: :language_skills
  has_many :prefered_meeting_times, dependent: :destroy
  has_many :received_messages, class_name: "Message", foreign_key: :receiver_id
  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true, length: { minimum: 50 }
  validates :dedication, presence: true, inclusion: { in: ["occassionally", "once per month", "once per week", "more often"] }
  # validates :gender, inclusion: { in: ["female", "male", "other"] }
  # validates :age, numericality: { only_integer: true, greater_than: 0, less_than: 110 }
  validates :native_dane, inclusion: { in: [ true, false ] }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_background, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def last_message_with(user)
    Message.where("(sender_id = ? and receiver_id = ?)", self.id, user.id).last.content
  end

  def last_created_at(user)
    Message.where("(sender_id = ? and receiver_id = ?)", self.id, user.id).last.created_at
  end
end
