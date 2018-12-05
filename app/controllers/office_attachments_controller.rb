class OfficeAttachmentsController < ApplicationController
  def edit
    @office_attachment = OfficeAttachment.find(params[:id])
    authorize @office_attachment.office
  end

  def update
    @office_attachment = OfficeAttachment.find(params[:office_attachment_id])
    respond_to do |format|
      if @office_attachment.update(office_attachment_params)
        format.html { redirect_to @office_attachment.office, notice: 'office attachment was successfully updated.' }
      end
    end
  end
end
