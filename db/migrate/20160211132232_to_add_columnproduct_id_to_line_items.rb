class ToAddColumnproductIdToLineItems < ActiveRecord::Migration
  def up
  	add_column :line_items, :product_id, :integer
  	add_index :line_items, :product_id
  end

  def down

  	remove_index :line_items, :product_id
  	remove_column :line_items, :product_id
  end
end
