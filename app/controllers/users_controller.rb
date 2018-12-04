class UsersController < ApplicationController
  def dashboard
    @user = current_user
    authorize @user
    # TODO
    # display information inside variable `current_user`
    # eg: user.offices, user.bookings
  end
end
