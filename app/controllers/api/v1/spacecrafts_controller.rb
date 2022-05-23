class Api::V1::SpacecraftsController < ApplicationController
  def index
    render json: spacecrafts, status: :ok
  end

  def show
    render json: spacecraft, status: :ok
  end

  def create
    @spacecraft = Spacecraft.new(spacecraft_params)
    if @spacecraft.save
      render json: @spacecraft
    else
      render error: { error: "Unable to Create spacecraft."}, status: 400
    end
  end

  def update
    if spacecraft
      spacecraft.update(spacecraft_params)
      render json: spacecraft, status: :ok
    else
      render error: { error: "Unable to Update spacecraft."}, status: 400
    end
  end

  def destroy
    if spacecraft
      spacecraft.destroy
      render json: { message: "spacecraft deleted Successfully"}, status: :ok
    else
      render error: { error: "Unable to Delete spacecraft."}, status: 400
    end
  end

  private

    def spacecrafts
      @_spacecrafts = Spacecraft.all
    end

    def spacecraft
      @_spacecraft ||= Spacecraft.find(params[:id])
    end

    def spacecraft_params
      params.require(:spacecraft).permit(:name, :launch_vehicle_id)
    end
end
