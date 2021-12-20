class Api::V1::SavedPlacesController < Api::V1::GraphitiController
  def index
    saved_places = SavedPlaceResource.all(params)
    respond_with(saved_places)
  end

  def show
    saved_place = SavedPlaceResource.find(params)
    respond_with(saved_place)
  end

  def create
    saved_place = SavedPlaceResource.build(params)

    if saved_place.save
      render jsonapi: saved_place, status: 201
    else
      render jsonapi_errors: saved_place
    end
  end

  def update
    saved_place = SavedPlaceResource.find(params)

    if saved_place.update_attributes
      render jsonapi: saved_place
    else
      render jsonapi_errors: saved_place
    end
  end

  def destroy
    saved_place = SavedPlaceResource.find(params)

    if saved_place.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: saved_place
    end
  end
end
