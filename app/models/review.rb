class Review < ApplicationRecord
  # Associations
  belongs_to :booking
  # office and host (= office.user)
  belongs_to :office, through: :bookings
  # guest
  belongs_to :user, through: :bookings

  # Validations
  validates :rating, presence: true, numericality: true, inclusion: { in: (0..5) }
end
