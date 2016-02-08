class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_no
      t.string :tracking_no
      t.date :delivery_date
      t.boolean :is_express_delivery
      t.boolean :is_customer_pickup
      t.string :delivery_slot
      t.string :carrier
      t.string :order_currency
      t.integer :order_value
      t.string :payment_collection
      t.string :special_instruction
      t.integer :address_id

      t.timestamps
    end
    add_index :orders, :address_id
  end
end
