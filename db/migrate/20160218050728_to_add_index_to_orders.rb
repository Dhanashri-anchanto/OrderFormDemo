class ToAddIndexToOrders < ActiveRecord::Migration
  def up
  	add_index :orders, :address_id
  	remove_column :orders, :first_name
  	remove_column :orders, :last_name
  	remove_column :orders, :mobile
  	remove_column :orders, :email
  	remove_column :orders, :shipping_address
  end

  def down
  	add_column :orders, :shipping_address, :string
  	add_column :orders, :email, :string
  	add_column :orders, :mobile, :string
  	add_column :orders, :last_name, :string
  	add_column :orders, :first_name, :string
  	remove_index :orders, :address_id
  end
end
