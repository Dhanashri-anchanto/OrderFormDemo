class ToAddColumnToLineItems < ActiveRecord::Migration
  def up
  	add_column :line_items, :product_name, :string
  end

  def down
  	remove_column :line_items, :product_name
  end
end
