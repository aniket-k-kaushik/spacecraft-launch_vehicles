class Launch < ApplicationRecord
  belongs_to :launch_vehicle
  belongs_to :spacecraft

  validates :launch_date, presence: true
  validates :launch_description, presence: true
  validates :launch_vehicle_id, presence: true
  validates :spacecraft_id, presence: true
  validate :validate_reuablility_of_launch_vehicle
  validate :validate_if_spacecraft_belongs_to_launch_vehicle

  private
    def validate_reuablility_of_launch_vehicle
      unless launch_vehicle.reusable?
        if Launch.where(launch_vehicle_id: self.launch_vehicle_id).present?
          errors.add(:launch_vehicle_can_only_lauch_once, "Launch Vehicle can only launch once")
        end
      end
    end

    def validate_if_spacecraft_belongs_to_launch_vehicle
      unless Spacecraft.find(self.spacecraft_id).launch_vehicle_id == launch_vehicle.id
        errors.add(:spacecraft_does_not_belong_to_that_launch_vehicle, "Spacecraft doesnot belong to that launch vehicle")
      end
    end

    def launch_vehicle
      @_launch_vehicle = LaunchVehicle.find(self.launch_vehicle_id)
    end
end
