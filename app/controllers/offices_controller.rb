class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_office, only: %i[show edit destroy]

  def index
    # Todo
    @offices = Office.all
  end

  def new
    # Todo
    @office = Office.new
  end

  def create
    # Todo
  end

  def show
    # @office = Office.find(params[:id])
    @booking = Booking.new # to generate the simple form
    # Todo
  end

  def edit
    # @office = Office.find(params[:id])
    # Todo
  end

  def update
    # Todo
  end

  def destroy
    # @office = Office.find(params[:id])
    # Todo
  end

  private

  def params_office
    # todo
  end

  def set_office
    @office = Office.find(params[:id])
  end
end
