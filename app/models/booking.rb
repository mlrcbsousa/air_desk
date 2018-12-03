class Booking < ApplicationRecord
  # Callbacks
  before_validation :set_price

  # Associations
  belongs_to :user
  belongs_to :office
  has_one :review

  # Validations
  validates_date :start_date, on_or_before: -> { Date.current }
  # test validations
  validates_date :end_date, on_or_after: -> { :start_date }
  validates :start_date, :end_date, presence: true
  validates :price, presence: true

  private

  def set_price
    self.price = (end_date - start_date) * office.dayrate if start_date && end_date
  end
end
