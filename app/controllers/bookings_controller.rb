class BookingsController < ApplicationController
  def create
    office = Office.find(params[:office_id])
    booking = office.bookings.new(params_booking)
    booking.user = current_user
    authorize booking
    # TO DO JS price validation (front-end)
    # render 'offices/show' if booking.price != booking.set_price

    if booking.save
      redirect_to dashboard_path
    else
      render 'offices/show'
    end
  end

  private

  def params_booking
    # todo
    params.require(:booking).permit(:start_date, :end_date, :price, :office_id, :user_id)
  end
end
