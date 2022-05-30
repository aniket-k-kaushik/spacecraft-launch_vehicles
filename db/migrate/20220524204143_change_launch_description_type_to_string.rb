class ChangeLaunchDescriptionTypeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :launches, :launch_description, :string
  end
end
