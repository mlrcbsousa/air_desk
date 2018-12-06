class Booking < ApplicationRecord
  # Callbacks
  before_validation :set_price

  # Associations
  belongs_to :user
  belongs_to :office
  has_one :review, dependent: :destroy

  # Validations
  validates :start_date, :end_date, :price, presence: true
  # validates_timeliness gem
  # rails generate validates_timeliness:install
  validates_date :start_date, on_or_after: :today
  validates_date :end_date, on_or_after: :start_date

  include PgSearch
  multisearchable against: %i[start_date end_date price]

  def format_price
    iprice = price.to_i
    if iprice > 999
      iprice.to_s.insert(-4, ',')
    else
      iprice
    end
  end

  private

  def set_price
    self.price = (end_date - start_date).to_i * office.dayrate if start_date && end_date
  end
end
