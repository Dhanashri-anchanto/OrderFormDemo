class ToAddColumnAddIdToOrders < ActiveRecord::Migration
  def up
  	add_column :orders, :address_id, :integer
  	
  end

  def down
  	remove_column :orders, :address_id  	
  end
end
