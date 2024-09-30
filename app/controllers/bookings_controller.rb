class BookingsController < ApplicationController
  
  def index 
    booking = Booking.all
    render json: booking, status: 200
  end

  def show 
    booking = Booking.find(params[:id])
    render json: booking, status: 200
  end

  def new 
    booking = Booking.new
    render json: booking, status: 200
  end

  def create 
    booking = Booking.new(params_booking)
    if booking.save
      render json: { status: 'SUCCESS', message: 'booking created', data: booking }, status: :created
    else
      render json: { status: 'SUCCESS', message: 'booking not created', data: booking }, status: :unprocessable_entity
    end
  end

  def update 
    booking = Booking.find(params[:id])
    if booking.update(params_booking)
      render json: { status: 'SUCCESS', message: 'booking update', data: booking },status: :ok
    else
      render json: { status: 'error', message: 'booking not update', data: booking.error }, status: :unprocessable_entity
    end
  end 

  def destroy
    booking = Booking.find(params[:id])
    if booking.destroy
      render json: { status: 'SUCCESS', message: 'booking delete' }, status: :ok 
    end
  end

  def params_booking
    params.require(:booking).permit(:name, :gender, :seat_no, :bookable_id, :bookable_type)
  end
end
