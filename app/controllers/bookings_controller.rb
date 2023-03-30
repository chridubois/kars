class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id].to_i)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to car_path(@car), notice: "Votre demande de location a bien été prise en compte. Vous serez notifié quand le propriétaire aura valider la location"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :accepted, :user, :car_id)
  end
end
