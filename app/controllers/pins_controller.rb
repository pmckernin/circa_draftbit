class PinsController < ApplicationController
  before_action :set_pin, only: %i[show edit update destroy]

  def index
    @q = Pin.ransack(params[:q])
    @pins = @q.result(distinct: true).includes(:user,
                                               :place).page(params[:page]).per(10)
  end

  def show; end

  def new
    @pin = Pin.new
  end

  def edit; end

  def create
    @pin = Pin.new(pin_params)

    if @pin.save
      message = "Pin was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @pin, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @pin.destroy
    message = "Pin was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to pins_url, notice: message
    end
  end

  private

  def set_pin
    @pin = Pin.find(params[:id])
  end

  def pin_params
    params.require(:pin).permit(:user_id, :place_id)
  end
end
