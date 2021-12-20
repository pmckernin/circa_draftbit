class VisitsController < ApplicationController
  before_action :set_visit, only: %i[show edit update destroy]

  def index
    @q = Visit.ransack(params[:q])
    @visits = @q.result(distinct: true).includes(:user,
                                                 :location).page(params[:page]).per(10)
  end

  def show; end

  def new
    @visit = Visit.new
  end

  def edit; end

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

  def update
    if @visit.update(visit_params)
      redirect_to @visit, notice: "Visit was successfully updated."
    else
      render :edit
    end
  end

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

  def set_visit
    @visit = Visit.find(params[:id])
  end

  def visit_params
    params.require(:visit).permit(:user_id, :location_id)
  end
end
