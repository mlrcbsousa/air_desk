class Booking < ApplicationRecord
  include PgSearch
  multisearchable against: %i[start_date end_date price]

  # Callbacks
  before_validation :set_price

  # Associations
  belongs_to :user
  belongs_to :office
  has_one :review, dependent: :destroy

  # Validations
  validates :start_date, :end_date, :price, presence: true
  validate :host_cant_guest
  # validates_timeliness gem
  # rails generate validates_timeliness:install
  validates_date :start_date, on_or_after: :today
  validates_date :end_date, on_or_after: :start_date

  def format_price
    # because price is a float
    iprice = price.to_i
    iprice > 999 ? iprice.to_s.insert(-4, ',') : iprice
  end

  private

  def host_cant_guest
    errors.add(:office, "Can't book your own office") if user == office.user
  end

  def set_price
    self.price = (end_date - start_date).to_i * office.dayrate if start_date && end_date
  end
end
