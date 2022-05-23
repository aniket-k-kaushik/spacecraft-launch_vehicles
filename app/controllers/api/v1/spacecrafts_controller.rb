class Api::V1::SpacecraftsController < ApplicationController
  def index
    render json: { spacecrafts: spacecraft }, status: :ok
  end 

  def show
    render json: { spacecraft: spacecraft }, status: :ok
  end 

  def create
    render json: , locals: {
      client: Client.create!(client_params)
    }, status: :ok
  end

  def update
  end 

  def destroy
  end

  private 

    def spacecraft
      @_spacecraft ||= Spacecraft.find(params[:id])
    end 

    def spacecrafts 
      @_spacecrafts = Spacecraft.all
    end 

    def spacecraft_params
      params.require(:spacecraft).permit(:name, :launch_vehicle_id)
    end
end
