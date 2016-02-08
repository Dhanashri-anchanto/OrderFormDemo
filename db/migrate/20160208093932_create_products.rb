class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.string :MFUPC
      t.float :cost_price
      t.float :retail_price
      t.string :storage_type
      t.integer :avail_min_qty
      t.float :weight
      t.float :height
      t.float :width
      t.float :depth
      t.integer :buffer_stock
      t.boolean :is_sample
      t.string :company
      t.string :merchant

      t.timestamps
    end
  end
end
