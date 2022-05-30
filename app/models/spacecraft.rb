class Spacecraft < ApplicationRecord
  belongs_to :launch_vehicle
  has_one :launch

  validates :name, presence: true
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :spacecraft_weight_sum_less_than_payload_capacity

  private
    def spacecraft_weight_sum_less_than_payload_capacity
      launch_vehicle = LaunchVehicle.find(self.launch_vehicle_id)
      payload_capacity = launch_vehicle.payload_capacity
      if self.id.nil?
        unless ((launch_vehicle.spacecrafts.sum(:weight)) + self.weight) <= payload_capacity
          errors.add(:weight_is_more_then_payload_capacity, "Sum of Weight of Spacecraft is more then the payload capacity of the Launch Vehicle")
        end
      else
        unless ((launch_vehicle.spacecrafts.sum(:weight) - (Spacecraft.find(self.id)).weight) + self.weight) <= payload_capacity
          errors.add(:weight_is_more_then_payload_capacity, "Sum of Weight of Spacecraft is more then the payload capacity of the Launch Vehicle")
        end
      end
    end
end
