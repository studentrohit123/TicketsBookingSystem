class BusesController < ApplicationController
  
  def index 
    bus = Bus.all
    render json: bus, state: 200
  end

  def new 
    bus = Bus.new
    render json: bus, status: 200
  end

  def create 
    bus = Bus.new(params_buses)
    if bus.save
      render json: { status: 'SUCCESS', message: 'Created buses', data: bus }, status: :created
    else 
      render json: { status: 'ERROR', message: 'Bus not create', data: bus.errors }, status: :unprocessable_entity
    end
  end

  def show 
    bus = Bus.find(params[:id])
    render json: bus, status: 200
  end

  # def edit 
  #   bus = Bus.find(params[:id])
  #   render json: bus, status: 200 
  # end

  def update 
    bus = Bus.find(params[:id])
    if bus.update(params_buses)
      render json: { status: 'SUCCESS', message: 'Updated buses', data: bus }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Bus not updated', data: bus.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    bus = Bus.find(params[:id])
    if bus.destroy
      render json: { status: 'SUCCESS', message: 'Delete buses', data: bus }, status: :ok 
    else
      render json: { status: 'ERROR', message: 'Bus not deleted', data: bus }, status: :unprocessable_entity
    end
  end

  def params_buses
    params.require(:bus).permit(:name, :number, :departure_time, :arrival_time, :directions_id)
  end
end