class Api::V1::SpacecraftsController < ApplicationController
  def index
    render json: spacecrafts, status: :ok
  end

  def show
    render json: spacecraft, status: :ok
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
      @_spacecrafts = Spacecraft.all
    end

    def spacecraft
      @_spacecraft ||= Spacecraft.find(params[:id])
    end

    def spacecraft_params
      params.require(:spacecraft).permit(:name, :weight, :launch_vehicle_id)
    end
end
