class CreateSpacecrafts < ActiveRecord::Migration[7.0]
  def change
    create_table :spacecrafts do |t|
      t.string :name
      t.references :launch_vehicles, null: false, foreign_key: true

      t.timestamps
    end
  end
end
