class CarsController < ApplicationController
  before_action :set_car, only: :show

  def index
    @cars = Car.all
    if params[:address].present?
      @cars = @cars.near(params[:address], 10000).to_a
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to my_cars_path, notice: "Vous venez de mettre une nouvelle voiture disponible à la location"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_cars
    @cars = Car.where(user: current_user)
  end

  def show
    @booked_dates_range = []
    @booking = Booking.new
    old_bookings = Booking.where(car: @car, accepted: true)
    old_bookings.each do |booking|
      @booked_dates_range << {
        "from" => booking.starts_at.strftime('%Y-%m-%d'),
        "to" => booking.ends_at.strftime('%Y-%m-%d')
      }
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year_of_production, :address, :price_per_day, :user)
  end
end
