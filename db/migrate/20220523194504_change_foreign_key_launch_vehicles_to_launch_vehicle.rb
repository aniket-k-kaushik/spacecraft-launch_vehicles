class ChangeForeignKeyLaunchVehiclesToLaunchVehicle < ActiveRecord::Migration[7.0]
  def change
    rename_column :spacecrafts, :launch_vehicles_id, :launch_vehicle_id
  end
end
