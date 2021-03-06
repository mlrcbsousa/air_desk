class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include PgSearch
  multisearchable against: %i[email username first_name last_name]

  # Carrierwave
  mount_uploader :avatar, AvatarUploader

  # Associations
  has_many :bookings
  has_many :offices, dependent: :destroy

  # Validations
  validates :username,
            length: { in: 0..20 },
            allow_blank: true,
            # must be a word character (letter, number, underscore)
            format: { with: /\A(\w+)\z/ }

  # must be a-z or ' ' (case-insensitive)
  validates :first_name, :last_name, allow_blank: true, format: { with: /\A([a-z \'\.']+)\z/i }

  def full_name
    "#{first_name.downcase.capitalize} #{last_name.downcase.capitalize}"
  end
end
