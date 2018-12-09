class ReviewsController < ApplicationController
  before_action :set_office, :set_booking
  before_action :set_review, only: %i[edit update destroy]

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(params_review)
    @review.booking = @booking
    authorize @review

    if @review.save
      redirect_to dashboard_path, notice: 'Thank you for submitting a review!'
    else
      render :new, alert: 'Unable to create your review.'
    end
  end

  def edit
    authorize @review.booking
    session[:review_previous_url] = request.referer
  end

  def update
    authorize @review.booking
    @review.update(params_review)
    if @review.save
      redirect_to session[:review_previous_url], notice: 'Review was successfully updated.'
    else
      render :edit, alert: 'Unable to update review.'
    end
  end

  def destroy
    authorize @review.booking
    @review.destroy
    redirect_to path_finder, notice: 'Review was successfully deleted.'
  end

  private

  def set_office
    @office = Office.find(params[:office_id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
