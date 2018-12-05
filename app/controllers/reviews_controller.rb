class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @office = Office.find(params[:office_id])
    @review = Review.new
    authorize @review
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review

    if @review.save
      redirect_to dashboard_path
    else
      @office = Office.find(params[:office_id])
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
