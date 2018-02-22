class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :wizards, through: :reviews
  validates :user_name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  has_many :votes

  mount_uploader :profile_photo, ProfilePhotoUploader
  def admin?
    role == "admin"
  end
end
