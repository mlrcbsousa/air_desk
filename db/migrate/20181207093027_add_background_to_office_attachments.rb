class AddBackgroundToOfficeAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :office_attachments, :background, :boolean, default: false
  end
end
