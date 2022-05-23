class Api::V1::LaunchVehiclesController < ApplicationController
  def index
    render json: launch_vehicles, status: :ok
  end

  def show
    spacecraft = launch_vehicle.spacecraft
    render json: { launch_vehicle: launch_vehicle, spacecraft: spacecraft }, status: :ok
  end

  def create
    @launch_vehicle = LaunchVehicle.new(launch_vehicle_params)
    if @launch_vehicle.save
      render json: @launch_vehicle
    else
      render error: { error: "Unable to Create launch_vehicle."}, status: 400
    end
  end

  def update
    if launch_vehicle
      launch_vehicle.update(launch_vehicle_params)
      render json: launch_vehicle, status: :ok
    else
      render error: { error: "Unable to Update launch_vehicle."}, status: 400
    end
  end

  def destroy
    if launch_vehicle
      launch_vehicle.update(launch_vehicle_params)
      render json: { message: "launch_vehicle #{launch_vehicle.name} deleted Successfully"}, status: :ok
    else
      render error: { error: "Unable to Delete launch_vehicle."}, status: 400
    end
  end

  private

  def launch_vehicles
    @_launch_vehicles = LaunchVehicle.all
  end

  def launch_vehicle
    @_launch_vehicle = LaunchVehicle.includes(:spacecrafts).find(params[:id])
  end

  def launch_vehicle_params
    params.require(:launch_vehicle).permit(:name)
  end
end
