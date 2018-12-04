class BookingsController < ApplicationController
  def create
    booking = office.bookings.new(params_booking)
    booking.user = current_user
    if booking.save
      redirect_to office_path(office)
    else
      render 'offices/show'
    end
  end

  private

  def params_booking
    # todo
  end
end
