class AddReferencesToOfficeAttachments < ActiveRecord::Migration[5.2]
  def change
    add_reference :office_attachments, :office, foreign_key: true
  end
end
