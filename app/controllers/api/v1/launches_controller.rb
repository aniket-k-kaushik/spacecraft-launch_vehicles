class Api::V1::LaunchesController < ApplicationController
  def index
    render json: launches, status: :ok
  end

  def show
    render json: { launch: launch }, status: :ok
  end

  def create
    render json: { launch: Launch.create!(launch_params) }
  end

  def update
    launch.update!(launch_params)
    render json: { launch: }
  end

  def destroy
    launch.destroy!
  end

  private

  def launches
    @_launches = Launch.all
  end

  def launch
    @_launch = Launch.find(params[:id])
  end

  def launch_params
    params.require(:launch).permit(:launch_date, :launch_description, :launch_vehicle_id, :spacecraft_id)
  end
end
