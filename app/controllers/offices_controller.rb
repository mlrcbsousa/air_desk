class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_office, only: %i[show edit destroy]

  def index
    # Todo
    # '/offices' url
    # offices_path helper
    @total = Office.count
    @query = params[:query]
    offices = @query ? Office.where("name LIKE '%#{@query}%'") : Office.all
    @offices = policy_scope(offices).order(created_at: :desc)
  end

  def new
    @office = Office.new
    authorize @office
  end

  def create
    # Todo
    @office = Office.new(params_office)

    # user = current_user
    authorize @office
    if @office.save
      redirect_to office_path(@office)
    else
      render :new
    end
  end

  def show
    authorize @office
    @booking = Booking.new # to generate the simple form

    # Todo
  end

  def edit
    # Todo
    # needs pundit here, only user can do this
  end

  def update
    # Todo
    @office = user.office.update(params_office)
    if @office.save
      redirect_to office_path(@office)
    else
      render :edit
    end
  end

  def destroy
    # Todo
    # needs pundit here
    @office.destroy
  end

  private

  def params_office
    # todo
    params.require(:office).permit(:name, :location, :description, :capacity, :dayrate)
  end

  def set_office
    @office = Office.find(params[:id])
  end
end
