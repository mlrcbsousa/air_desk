class BookingsController < ApplicationController
  def create
    @office = Office.find(params[:office_id])

    # start_date = Date.parse(params[:booking][:start_date], "%Y%m%d") if params[:booking][:start_date]&.match(/(\w+)/)
    # end_date = Date.parse(params[:booking][:end_date], "%Y%m%d") if params[:booking][:end_date]&.match(/(\w+)/)

    @booking = @office.bookings.new(params_booking)
    # start_date: start_date,
    # end_date: end_date
    # )

    @booking.user = current_user
    authorize @booking
    # TO DO JS price validation (front-end)
    # render 'offices/show' if booking.price != booking.set_price

    if @booking.save
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
