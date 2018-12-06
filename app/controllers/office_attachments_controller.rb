class OfficeAttachmentsController < ApplicationController
  before_action :set_office_attachment, :set_office

  def edit
    authorize @office
  end

  def update
    authorize @office
    if @office_attachment.update(params_office_attachment)
      redirect_to @office, notice: 'Office attachment was successfully updated.'
    else
      render :edit, alert: 'Error while updating attachment.'
    end
  end

  private

  def params_office_attachment
    params.require(:office_attachment).permit(:attachment, :office_id)
  end

  def set_office
    @office = Office.find(params[:office_id])
  end

  def set_office_attachment
    @office_attachment = OfficeAttachment.find(params[:id])
  end
end
