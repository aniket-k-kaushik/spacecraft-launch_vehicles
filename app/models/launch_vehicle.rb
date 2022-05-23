class LaunchVehicle < ApplicationRecord
  has_many :spacecrafts

  validates :name, presence: true

  def spacecraft
    spacecrafts.each do |spacecraft|
      {
        id: spacecraft.id,
        name: spacecraft.name
      }
    end
  end
end
