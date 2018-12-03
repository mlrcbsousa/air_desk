class OfficeAttachment < ApplicationRecord
  belongs_to :office
  mount_uploader :attachment, OfficeAttachmentUploader
end
