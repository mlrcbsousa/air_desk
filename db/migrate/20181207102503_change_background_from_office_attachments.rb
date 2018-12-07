class ChangeBackgroundFromOfficeAttachments < ActiveRecord::Migration[5.2]
  def change
    change_column :office_attachments, :background, :boolean, default: true
  end
end
