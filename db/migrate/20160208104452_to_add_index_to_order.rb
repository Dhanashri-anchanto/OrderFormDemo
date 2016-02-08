class ToAddIndexToOrder < ActiveRecord::Migration
  def up
  	add_index :orders, :customer_id
  end

  def down
  	remove_index :orders, :customer_id
  end
end
