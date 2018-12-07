class Office < ApplicationRecord
  geocoded_by :address
  after_validation :geocode # if: :will_save_change_to_address?

  # Associations
  has_many :office_attachments, dependent: :destroy
  accepts_nested_attributes_for :office_attachments
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
  belongs_to :user

  # Validations
  validates :city, :street, :name, :capacity, :dayrate, presence: true
  validates :dayrate, :capacity, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, inclusion: { in: (1..20) }

  validates :name, length: { in: 10..140 }
  validates :name, :city, :street, allow_blank: false, format: { with: /\A([a-z 0-9\.\'\:\,']+)\z/i }

  include PgSearch
  multisearchable against: %i[name city street]

  # example
  pg_search_scope :search_by_name_and_city_and_street,
                  against: %i[name city street],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }

  pg_search_scope :global_search,
                  against: %i[name city street],
                  associated_against: {
                    user: %i[email first_name last_name username]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  def format_dayrate
    array = dayrate.to_s.split(".")
    fdayrate = array[0].to_i > 999 ? array[0].insert(-4, ',') : array[0]
    array[1] == '0' ? fdayrate : fdayrate + array[1]
  end

  def avg_rating
    return 0 if reviews.count.zero?

    reviews.map(&:rating).sum / reviews.count
  end

  def blank_main
    office_attachments.each { |office_attachment| office_attachment.update(main: false) }
  end

  def main
    office_attachments.select { |office_attachment| office_attachment.main == true }[0]
  end

  def address
    "#{street}, #{city}"
  end

  def set_marker
    { lng: longitude, lat: latitude }
  end
end
