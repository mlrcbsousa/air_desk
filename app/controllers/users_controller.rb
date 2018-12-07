class UsersController < ApplicationController
  def dashboard
    @user = current_user
    authorize @user
    @bookings = @user.bookings
    @offices = @user.offices
  end
end
