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

  include PgSearch
  multisearchable against: %i[name location]

  pg_search_scope :search_by_name_and_location,
                  against: %i[name location],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }

  pg_search_scope :global_search,
                  against: %i[name location],
                  associated_against: {
                    user: %i[email first_name last_name username]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  def avg_rating
    return 0 if reviews.count.zero?

    reviews.map(&:rating).sum / reviews.count
  end
end
