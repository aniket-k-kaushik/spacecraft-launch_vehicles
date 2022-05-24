class LaunchVehicle < ApplicationRecord
  has_many :spacecrafts

  validates :name, presence: true
  validates :payload_capacity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def spacecraft_lists
    spacecrafts.each do |spacecraft|
      {
        id: spacecraft.id,
        name: spacecraft.name,
        weight: spacecraft.weight
      }
    end
  end
end
