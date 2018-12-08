class BookingsController < ApplicationController
  before_action :set_office, only: %i[create edit]
  before_action :set_booking, only: %i[edit update destroy]

  def create
    @booking = @office.bookings.new(params_booking)
    @booking.user = current_user
    authorize @booking
    @reviews = @office.reviews
    @office_attachments = @office.office_attachments
    # backend javascript check render 'offices/show' if booking.price != booking.set_price
    if @booking.user == @booking.office.user
      redirect_to office_path(@office), alert: 'You can not book your own office!'
    elsif @booking.save
      redirect_to dashboard_path, notice: 'Booking successfully created.'
    else
      render 'offices/show', alert: 'Could not create Booking.'
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    @booking.update(params_booking)
    if @booking.save
      redirect_to dashboard_path, notice: 'Booking was successfully updated.'
    else
      render :edit, alert: 'Unable to update booking.'
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to path_finder, notice: 'Booking was successfully deleted.'
  end

  private

  def set_office
    @office = Office.find(params[:office_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :price, :office_id, :user_id)
  end
end
