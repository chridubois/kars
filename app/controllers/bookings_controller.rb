class BookingsController < ApplicationController
  def index
    @bookings = []
    @cars = Car.where(user: current_user)
    @cars.each do |car|
      my_bookings = Booking.where(car: car)
      my_bookings.each do |booking|
        @bookings << booking
      end
    end
  end

  def rent_cars
    @bookings = Booking.where(user: current_user)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bookings_path, notice: "La demande de location #{@booking.id} a été acceptée"
  end

  def create
    @booking = Booking.new
    date_range = params[:booking]["starts_at"]
    starts_at = date_range.split.first.to_date
    ends_at = date_range.split.last.to_date
    @car = Car.find(params[:car_id].to_i)
    @booking.starts_at = starts_at
    @booking.ends_at = ends_at
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to car_path(@car), notice: "Votre demande de location a bien été prise en compte. Vous serez notifié quand le propriétaire aura validé la location"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :accepted, :user, :car_id)
  end
end
