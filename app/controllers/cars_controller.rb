class CarsController < ApplicationController
  before_action :set_car, only: :show

  def index
    @cars = Car.all
    if params[:address].present?
      @cars = @cars.where(addres: params[:address])
    end

  end

  def show
    @booking = Booking.new
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end
end
