class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @booking = booking.find(params[:booking_id])
    @review = @booking.reviews.new(review_params)

    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
