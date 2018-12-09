class OfficeAttachmentsController < ApplicationController
  before_action :set_office
  before_action :set_office_attachment, except: %i[new create background]

  def background
    authorize @office
    @office.main!
    @office_attachment = OfficeAttachment.find(params[:office_attachment_id])
    @office_attachment.update(main: true)
    redirect_to @office, notice: 'Successfully changed your main Image!'
  end

  def new
    authorize @office
    @office_attachment = OfficeAttachment.new
  end

  def create
    @office_attachment = OfficeAttachment.new(params_office_attachment)
    @office_attachment.office = @office
    authorize @office

    if @office_attachment.save
      @office_attachments = @office.office_attachments
      redirect_to @office, notice: 'Successfully added Photo to your Office!'
    else
      render :new, alert: 'Unable to add your photo.'
    end
  end

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

  def destroy
    authorize @office
    @office_attachment.destroy
    respond_to do |format|
      format.html { redirect_to @office, notice: 'Image was successfully deleted.' }
      format.js
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
