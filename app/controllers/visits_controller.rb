class VisitsController < ApplicationController
  before_action :set_visit, only: %i[show edit update destroy]

  # GET /visits
  def index
    @q = Visit.ransack(params[:q])
    @visits = @q.result(distinct: true).includes(:user,
                                                 :location).page(params[:page]).per(10)
  end

  # GET /visits/1
  def show; end

  # GET /visits/new
  def new
    @visit = Visit.new
  end

  # GET /visits/1/edit
  def edit; end

  # POST /visits
  def create
    @visit = Visit.new(visit_params)

    if @visit.save
      message = "Visit was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @visit, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /visits/1
  def update
    if @visit.update(visit_params)
      redirect_to @visit, notice: "Visit was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /visits/1
  def destroy
    @visit.destroy
    message = "Visit was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to visits_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_visit
    @visit = Visit.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def visit_params
    params.require(:visit).permit(:user_id, :location_id)
  end
end
