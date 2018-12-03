class Review < ApplicationRecord
  has_one :booking
  belongs_to :office, through: :bookings
end
