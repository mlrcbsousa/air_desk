class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_office, only: %i[show edit destroy]

  def index
    # Todo
    @offices = Office.all
    # '/offices' url
    # offices_path helper
  end

  def new
    # Todo
    @office = Office.new
    # needs pundit here, only user can do this
  end

  def create
    # Todo
    # check what comes from params
    user = current_user
    @office = user.office.new(params_office)
    if @office.save
      redirect_to office_path(@office)
    else
      render :new
    end
  end

  def show
    # @office = Office.find(params[:id])
    @booking = Booking.new # to generate the simple form
    # Todo
  end

  def edit
    # @office = Office.find(params[:id])
    # Todo
    # needs pundit here, only user can do this
  end

  def update
    # Todo
    user = current_user
    @office = user.office.update(params_office)
    if @office.save
      redirect_to office_path(@office)
    else
      render :new
    end
  end

  def destroy
    # @office = Office.find(params[:id])
    # Todo
    # needs pundit here
    @office.destroy
  end

  private

  def params_office
    # todo
  end

  def set_office
    @office = Office.find(params[:id])
  end
end
