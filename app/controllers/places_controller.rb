class PlacesController < ApplicationController
  before_action :set_place, only: %i[show edit update destroy]

  def index
    @q = Place.ransack(params[:q])
    @places = @q.result(distinct: true).includes(:saved_places, :notes,
                                                 :pins, :visits).page(params[:page]).per(10)
  end

  def show
    @visit = Visit.new
    @pin = Pin.new
    @note = Note.new
    @saved_place = SavedPlace.new
  end

  def new
    @place = Place.new
  end

  def edit; end

  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to @place, notice: "Place was successfully created."
    else
      render :new
    end
  end

  def update
    if @place.update(place_params)
      redirect_to @place, notice: "Place was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @place.destroy
    redirect_to places_url, notice: "Place was successfully destroyed."
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :city)
  end
end
