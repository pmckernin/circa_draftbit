class Api::V1::PinsController < Api::V1::GraphitiController
  def index
    pins = PinResource.all(params)
    respond_with(pins)
  end

  def show
    pin = PinResource.find(params)
    respond_with(pin)
  end

  def create
    pin = PinResource.build(params)

    if pin.save
      render jsonapi: pin, status: :created
    else
      render jsonapi_errors: pin
    end
  end

  def update
    pin = PinResource.find(params)

    if pin.update_attributes
      render jsonapi: pin
    else
      render jsonapi_errors: pin
    end
  end

  def destroy
    pin = PinResource.find(params)

    if pin.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: pin
    end
  end
end
