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
  validates :username,
            uniqueness: true,
            length: { in: 2..20 },
            # must be a word character (letter, number, underscore)
            format: { with: /\A(\w+)\z/ }

  # must be a-z or ' ' (case-insensitive)
  validates :first_name, :last_name, allow_blank: false, format: { with: /\A([a-z ]+)\z/i }

  def full_name
    "#{first_name.downcase.capitalize} #{last_name.downcase.capitalize}"
  end
end
