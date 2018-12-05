class UsersController < ApplicationController
  def dashboard
    @user = current_user
    authorize @user
    @bookings = @user.bookings
    @offices = @user.offices

    # @reviews = @office.bookings.select(&:review).map!(&:review)
  end
end
