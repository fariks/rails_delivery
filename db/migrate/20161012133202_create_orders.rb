class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :load, foreign_key: true
      t.date :deliveryDate
      t.string :deliveryShift
      t.string :originName
      t.string :clientName
      t.string :phoneNumber
      t.string :mode
      t.integer :purchaseOrderNumber

      t.timestamps
    end
    add_column :orders, :origin_address_id, :integer, foreign_key: true
    add_column :orders, :destination_address_id, :integer, foreign_key: true
  end
end
