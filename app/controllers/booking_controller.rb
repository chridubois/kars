class BookingController < ApplicationController
  def create
    @car = Car.find(params[:id])
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :accepted, :user, :car)
  end
end
