class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_office, only: %i[show edit update destroy]
  after_action :set_office_previous_url, only: %i[new edit]
  layout 'map', only: %i[index show]

  def index
    @total = Office.count
    @query = params[:query]
    if @query.present?
      offices = Office.global_search(@query)
      # results = PgSearch.multisearch(@query)
    else
      offices = Office.all
    end
    @offices = policy_scope(offices).order(created_at: :desc)
    @markers = @offices.map { |office| get_window(office) }
  end

  def new
    @office = Office.new
    @office_attachment = @office.office_attachments.build
    authorize @office
  end

  def create
    @office = Office.new(params_office)
    @office.user = current_user
    authorize @office
    if @office.save
      unless params[:office_attachments].nil?
        params[:office_attachments]['attachment'].each do |a|
          @office_attachment = @office.office_attachments.create!(attachment: a)
        end
      end
      redirect_to @office, notice: 'Office was successfully created.'
    else
      render :new, alert: 'Unable to create office.'
    end
  end

  def show
    authorize @office
    @booking = Booking.new
    @reviews = @office.reviews
    @office_attachments = @office.office_attachments
    @markers = [@office.set_marker]
  end

  def edit
    authorize @office
  end

  def update
    authorize @office
    @office.update(params_office)
    if @office.save
      redirect_to session[:office_previous_url], notice: 'Office was successfully updated.'
    else
      render :edit, alert: 'Unable to update office.'
    end
  end

  def destroy
    authorize @office
    @office.destroy
    respond_to do |format|
      format.html { redirect_to session[:office_previous_url], notice: 'Office was successfully deleted.' }
      format.js
    end
  end

  private

  def params_office
    params.require(:office).permit(
      :name,
      :city,
      :street,
      :description,
      :capacity,
      :dayrate,
      office_attachments_attributes: %i[id office_id attachment]
    )
  end

  def set_office
    @office = Office.find(params[:id])
  end

  def get_window(office)
    marker = office.set_marker
    marker[:infoWindow] = {
      content: render_to_string(
        partial: "/offices/map_window",
        locals: { office: office }
      )
    }
    marker
  end

  def set_office_previous_url
    session[:office_previous_url] = request.referer
  end
end
