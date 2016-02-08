class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :sku
      t.integer :product_id
      t.integer :order_id
      t.string :description
      t.integer :qty
      t.float :price

      t.timestamps
    end
    add_index :line_items, :product_id
    add_index :line_items, :order_id
  end
end
