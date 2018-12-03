class AddAttachmentToOfficeAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :office_attachments, :attachment, :string
  end
end
