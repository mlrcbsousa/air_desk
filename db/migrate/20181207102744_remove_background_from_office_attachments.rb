class RemoveBackgroundFromOfficeAttachments < ActiveRecord::Migration[5.2]
  def change
    remove_column :office_attachments, :background
  end
end
