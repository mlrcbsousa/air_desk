class AddMainToOfficeAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :office_attachments, :main, :boolean
  end
end
