class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_office, only: %i[show edit update destroy]

  def index
    @total = Office.count
    @query = params[:query]
    offices = @query ? Office.where("name LIKE '%#{@query}%'") : Office.all
    @offices = policy_scope(offices).order(created_at: :desc)
  end

  def new
    @office = Office.new
    authorize @office
  end

  def create
    @office = Office.new(params_office)
    authorize @office
    if @office.save
      redirect_to office_path(@office)
    else
      render :new
    end
  end

  def show
    authorize @office
    @booking = Booking.new # to generate the simple form
    # this is some sexy shit right here, no jokes
    @reviews = @office.bookings.select(&:review).map!(&:review)
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
    params.require(:office).permit(:name, :location, :description, :capacity, :dayrate)
  end

  def set_office
    @office = Office.find(params[:id])
  end
end
