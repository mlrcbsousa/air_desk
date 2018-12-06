class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_office, only: %i[show edit update destroy]

  # layout 'map', only: :index

  def index
    @total = Office.count
    @query = params[:query]
    if @query.present?
      # offices = Office.search_by_name_and_location(@query)
      offices = Office.global_search(@query)
      # results = PgSearch.multisearch(@query)
    else
      offices = Office.all
    end
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
    if @office.save
      params[:office_attachments]['attachment'].each do |a|
        @office_attachment = @office.office_attachments.create!(attachment: a)
      end
      redirect_to @office, notice: 'Office was successfully created.'
    else
      render :new, alert: 'Unable to create office.'
    end
  end

  def show
    authorize @office
    @booking = Booking.new
    @reviews = @office.reviews
    @office_attachments = @office.office_attachments.all
  end

  def edit
    authorize @office
  end

  def update
    authorize @office
    @office.update(params_office)
    if @office.save
      redirect_to @office, notice: 'Office was successfully updated.'
    else
      render :edit, alert: 'Unable to update office.'
    end
  end

  def destroy
    authorize @office
    @office.destroy
    redirect_to dashboard_path, notice: 'Office was successfully deleted.'
  end

  private

  def params_office
    params.require(:office).permit(
      :name,
      :city,
      :street,
      :description,
      :capacity,
      :dayrate,
      office_attachments_attributes: %i[id office_id attachment]
    )
  end

  def set_office
    @office = Office.find(params[:id])
  end
end
