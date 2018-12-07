class OfficeAttachment < ApplicationRecord
  # Associations
  belongs_to :office
  mount_uploader :attachment, OfficeAttachmentUploader

  # Validations
  validates :attachment, presence: true
end
