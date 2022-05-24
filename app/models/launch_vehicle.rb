class LaunchVehicle < ApplicationRecord
  has_many :spacecrafts
  has_many :launches

  validates :name, presence: true
  validates :payload_capacity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def spacecraft_lists
    spacecrafts.map do |spacecraft|
      {
        id: spacecraft.id,
        name: spacecraft.name,
        weight: spacecraft.weight
      }
    end
  end

  def launch_lists
    launches.map do |launch|
      {
        id: launch.id,
        description: launch.launch_description,
        date: launch.launch_date,
        spacecraft: launch.spacecraft.name
      }
    end
  end
end
