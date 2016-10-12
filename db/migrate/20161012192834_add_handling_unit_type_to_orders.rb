class AddHandlingUnitTypeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :handlingUnitType, :string
  end
end
