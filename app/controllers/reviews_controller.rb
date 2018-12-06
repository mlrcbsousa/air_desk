class ReviewsController < ApplicationController
  before_action :set_office, :set_booking

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review

    if @review.save
      redirect_to dashboard_path, notice: 'Thank you for submitting a review!'
    else
      render :new, alert: 'Unable to create your review.'
    end
  end

  private

  def set_office
    @office = Office.find(params[:office_id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
