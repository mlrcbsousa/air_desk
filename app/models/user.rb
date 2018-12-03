class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Carrierwave
  mount_uploader :avatar, AvatarUploader

  # Associations
  has_many :bookings
  has_many :offices, through: :bookings

  # Validations
  validates :username, uniqueness: true

  def full_name
    "#{first_name.downcase.capitalize} #{last_name.downcase.capitalize}"
  end
end
