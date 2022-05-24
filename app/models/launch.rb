class Launch < ApplicationRecord
  belongs_to :launch_vehicle
  belongs_to :spacecraft

  validates :launch_date, presence: true
  validates :launch_description, presence: true
  validates :launch_vehicle_id, presence: true
  validates :spacecraft_id, presence: true
  
end
