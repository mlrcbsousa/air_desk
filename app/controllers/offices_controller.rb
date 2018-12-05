class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_office, only: %i[show edit update destroy]

  # layout 'map', only: :index

  def index
    @total = Office.count
    @query = params[:query]
    offices = @query ? Office.where("name LIKE '%#{@query}%'") : Office.all
    @offices = policy_scope(offices).order(created_at: :desc)
  end

  def new
    @office = Office.new
    @office_attachment = @office.office_attachments.build
    authorize @office
  end

  def create
    @office = Office.new(params_office)
    @office.user = current_user
    authorize @office

    respond_to do |format|
      if @office.save
        # params[:office][:office_attachments_attributes][:'0'][:attachment]
        params[:office_attachments]['attachment'].each do |a|
        # params[:office_attachments]['attachment'].each do |a|
          @office_attachment = @office.office_attachments.create!(attachment: a)
        end
        format.html { redirect_to @office, notice: 'office was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    authorize @office
    @booking = Booking.new # to generate the simple form
    # this is some sexy shit right here, no jokes, but not needed lol
    # @reviews = @office.bookings.select(&:review).map!(&:review)
    @reviews = @office.reviews
    @office_attachments = @office.office_attachments.all
  end

  def edit
    authorize @office
  end

  def update
    @office.update(params_office)
    if @office.save
      redirect_to office_path(@office)
    else
      render :edit
    end
  end

  def destroy
    authorize @office
    @office.destroy
    redirect_to dashboard_path
  end

  private

  def params_office
    params.require(:office).permit(
      :name,
      :location,
      :description,
      :capacity,
      :dayrate,
      office_attachments_attributes: [:id, :office_id, :attachment]
    )
  end

  def set_office
    @office = Office.find(params[:id])
  end
end
