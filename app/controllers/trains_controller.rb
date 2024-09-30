class TrainsController < ApplicationController

  def index 
    trains = Train.all
    render json: trains, status: 200
  end

  def new 
    train = Train.new
    render json: train, status:
  end
  
  def create
    train = Train.new(trains_params)
    if train.save
      render json: { status: 'SUCCESS', message: 'Created trains', data: train }, status: :created
    else
      render json: { status: 'ERROR', message: 'train not created', data: train.error }, state: :unprocessable_entity
    end
  end

  def show 
    train = Train.find(params[:id])
    render json: train, status: 200
  end

  def update
    train = Train.find(params[:id])
    if train.update(trains_params)
      render json: { status: 'Update', message: 'train updated', data: train }, status: :ok
    else
      render json: { status: 'Error', message: 'train not update', data: train }, status: :unprocessable_entity
    end
  end

  def destroy 
    train = Train.find(params[:id])
    if train.destroy
      render json: { status: 'Delete', message: 'Trains delete', data: train }, status: :ok
    end
  end

  def trains_params
    params.require(:train).permit(:name, :number, :departure_time, :arrival_time, :direction_id)
  end
end