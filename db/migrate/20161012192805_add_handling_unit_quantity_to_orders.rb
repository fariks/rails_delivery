class AddHandlingUnitQuantityToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :handlingUnitQuantity, :integer
  end
end
