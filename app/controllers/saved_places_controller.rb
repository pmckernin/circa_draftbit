class SavedPlacesController < ApplicationController
  before_action :set_saved_place, only: %i[show edit update destroy]

  def index
    @q = SavedPlace.ransack(params[:q])
    @saved_places = @q.result(distinct: true).includes(:user,
                                                       :place).page(params[:page]).per(10)
  end

  def show; end

  def new
    @saved_place = SavedPlace.new
  end

  def edit; end

  def create
    @saved_place = SavedPlace.new(saved_place_params)

    if @saved_place.save
      message = "SavedPlace was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @saved_place, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @saved_place.update(saved_place_params)
      redirect_to @saved_place, notice: "Saved place was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @saved_place.destroy
    message = "SavedPlace was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to saved_places_url, notice: message
    end
  end

  private

  def set_saved_place
    @saved_place = SavedPlace.find(params[:id])
  end

  def saved_place_params
    params.require(:saved_place).permit(:place_id, :user_id)
  end
end
