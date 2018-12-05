class OfficeAttachmentsController < ApplicationController
  def update
    respond_to do |format|
      if @office_attachment.update(office_attachment_params)
        format.html { redirect_to @office_attachment.office, notice: 'office attachment was successfully updated.' }
      end
    end
  end
end
