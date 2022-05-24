class Api::V1::LaunchVehiclesController < ApplicationController
  def index
    render json: launch_vehicles, status: :ok
  end

  def show
    spacecraft_lists = launch_vehicle.spacecraft_lists
    render json: { launch_vehicle: launch_vehicle, spacecraft_lists: spacecraft_lists }, status: :ok
  end

  def create
    render json: { launch_vehicle: LaunchVehicle.create!(launch_vehicle_params) }
  end

  def update
    launch_vehicle.update!(launch_vehicle_params)
    render json: { launch_vehicle: }
  end

  def destroy
    launch_vehicle.destroy!
  end

  private

    def launch_vehicles
      @_launch_vehicles = LaunchVehicle.all
    end

    def launch_vehicle
      @_launch_vehicle = LaunchVehicle.includes(:spacecrafts).find(params[:id])
    end

    def launch_vehicle_params
      params.require(:launch_vehicle).permit(:name, :payload_capacity)
    end
end
