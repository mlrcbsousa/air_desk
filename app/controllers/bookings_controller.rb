class BookingsController < ApplicationController
  def create
    @office = Office.find(params[:office_id])
    @booking = @office.bookings.new(params_booking)
    @booking.user = current_user
    authorize @booking
    # backend javascript check render 'offices/show' if booking.price != booking.set_price
    render 'offices/show', alert: 'You can not book your own office!' if @booking.user == @booking.office.user
    if @booking.save
      redirect_to dashboard_path, notice: 'Booking successfully created.'
    else
      render 'offices/show', alert: 'Could not create Booking.'
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :price, :office_id, :user_id)
  end
end
