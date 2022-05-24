class Api::V1::SpacecraftsController < ApplicationController
  def index
    spacecraft_details = spacecrafts.map do |spacecraft|
      launch_date = if spacecraft.launch.present?
         spacecraft.launch.launch_date
      else
        "yet to be launched"
      end
      {
        name: spacecraft.name,
        weight: spacecraft.weight,
        launch_vehicle: spacecraft.launch_vehicle.name,
        launch_date: launch_date
      }
    end
    render json: { spacecrafts: spacecraft_details }, status: :ok
  end

  def show
    launch_date = if spacecraft.launch.present?
                    spacecraft.launch.launch_date
                  else
                    "yet to be launched"
                  end
    spacecraft_details = {
      name: spacecraft.name,
      weight: spacecraft.weight,
      launch_vehicle: spacecraft.launch_vehicle.name,
      launch_date: launch_date
    }
    render json: { spacecraft: spacecraft_details }, status: :ok
  end
  def create
    render json: { spacecraft: Spacecraft.create!(spacecraft_params) }
  end

  def update
    spacecraft.update!(spacecraft_params)
    render json: { spacecraft: }
  end

  def destroy
    spacecraft.destroy
  end

  private

    def spacecrafts
      @_spacecrafts = Spacecraft.includes([:launch_vehicle, :launch]).all
    end

    def spacecraft
      @_spacecraft ||= Spacecraft.find(params[:id])
    end

    def spacecraft_params
      params.require(:spacecraft).permit(:name, :weight, :launch_vehicle_id)
    end
end
