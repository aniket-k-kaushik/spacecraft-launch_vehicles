class Spacecraft < ApplicationRecord
  belongs_to :launch_vehicle

  validates :name, presence: true
end
