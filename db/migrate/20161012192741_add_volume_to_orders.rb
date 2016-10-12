class AddVolumeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :volume, :float
  end
end
