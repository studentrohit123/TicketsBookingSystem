class DirectionsController < ApplicationController

  def index 
    direction = Direction.all 
    render json: direction, status: 200
  end

  def new 
    direction = Direction.new 
    render json: direction, status: 200
  end

  def create 
    direction = Direction.new(direction_params)
    if direction.save 
      render json: { status: 'SUCCESS', message: 'Created direction', data: direction }, status: :created
    else
      render json: { status: 'ERROR', message: 'Direction not created', data: direction.errors }, status: :unprocessable_entity
    end
  end

  def show 
    direction = Direction.find(params[:id])
    render json: direction, status: 200
  end

  # def edit 
  #   direction = Direction.find(params[:id])
  #   render json: direction, status: 200
  # end 

  def update 
    direction = Direction.find(params[:id])
    if direction.update(direction_params)
      render json: { status: 'SUCCESS', message: 'Updated direction', data: direction }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Direction not updated', data: direction.errors }, status: :unprocessable_entity
    end
  end

  def destroy 
    direction = Direction.find(params[:id])
    if direction.destroy
      render json: { status: 'SUCCESS', message: 'Deleted direction' }, status: :ok 
    end
  end

  private
  
  def direction_params
    params.require(:direction).permit(:source, :destination, :distance)
  end
end
