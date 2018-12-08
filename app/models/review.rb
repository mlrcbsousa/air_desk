class Review < ApplicationRecord
  include PgSearch
  multisearchable against: :rating

  # Associations
  belongs_to :booking
  # guest = review.booking.user
  # host = review.booking.office.user

  # Validations
  validates :rating, presence: true, numericality: true, inclusion: { in: (0..5) }
end
