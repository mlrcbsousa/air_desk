class BookingsController < ApplicationController
  def create
    office = Office.find(params[:office_id])
    booking = office.bookings.new(params_booking)
    booking.user = current_user
    authorize booking
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
