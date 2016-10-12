class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :vehicleType
      t.integer :maxVolume

      t.timestamps
    end
  end
end
