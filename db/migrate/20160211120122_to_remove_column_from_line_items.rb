class ToRemoveColumnFromLineItems < ActiveRecord::Migration
  def up
  	remove_column :line_items, :product_id
  end

  def down
  		add_column :line_items, :product_id, :integer
  end
end
