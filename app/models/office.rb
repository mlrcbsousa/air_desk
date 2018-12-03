class Office < ApplicationRecord
  # Associations
  has_many :office_attachments
  accepts_nested_attributes_for :office_attachments
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
  belongs_to :user

  # Validations
  validates :location, :name, :capacity, :dayrate, presence: true
  # validates :name, uniqueness: true
  validates :dayrate, :capacity, numericality: true
  validates :capacity, inclusion: { in: (1..20) }
end
