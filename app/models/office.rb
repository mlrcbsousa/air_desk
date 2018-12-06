class Office < ApplicationRecord
  # Associations
  has_many :office_attachments, dependent: :destroy
  accepts_nested_attributes_for :office_attachments
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
  belongs_to :user

  # Validations
  validates :location, :name, :capacity, :dayrate, presence: true
  validates :dayrate, :capacity, numericality: true
  validates :capacity, inclusion: { in: (1..20) }

  validates :name, length: { in: 10..140 }
  validates :name, :location, allow_blank: false, format: { with: /\A([a-z ]+)\z/i }

  def avg_rating
    return 0 if reviews.count.zero?

    reviews.map(&:rating).sum / reviews.count
  end
end
