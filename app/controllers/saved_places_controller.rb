class SavedPlacesController < ApplicationController
  before_action :set_saved_place, only: [:show, :edit, :update, :destroy]

  # GET /saved_places
  def index
    @saved_places = SavedPlace.all
  end

  # GET /saved_places/1
  def show
  end

  # GET /saved_places/new
  def new
    @saved_place = SavedPlace.new
  end

  # GET /saved_places/1/edit
  def edit
  end

  # POST /saved_places
  def create
    @saved_place = SavedPlace.new(saved_place_params)

    if @saved_place.save
      redirect_to @saved_place, notice: 'Saved place was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /saved_places/1
  def update
    if @saved_place.update(saved_place_params)
      redirect_to @saved_place, notice: 'Saved place was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /saved_places/1
  def destroy
    @saved_place.destroy
    redirect_to saved_places_url, notice: 'Saved place was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_place
      @saved_place = SavedPlace.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def saved_place_params
      params.require(:saved_place).permit(:place_id, :user_id)
    end
end
