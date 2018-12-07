class ReAddMainToOfficeAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :office_attachments, :main, :boolean, default: true
  end
end
