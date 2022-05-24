class AddWeightToSpacecraft < ActiveRecord::Migration[7.0]
  def change
    add_column :spacecrafts, :weight, :integer, default: 0
  end
end
