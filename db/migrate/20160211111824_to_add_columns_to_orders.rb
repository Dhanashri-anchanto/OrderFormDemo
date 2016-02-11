class ToAddColumnsToOrders < ActiveRecord::Migration
	def up
		add_column :orders, :first_name, :string
		add_column :orders, :last_name, :string
		add_column :orders, :email, :string
		add_column :orders, :mobile, :string
		add_column :orders, :shipping_address, :string
	end

	def down
		remove_column :orders, :shipping_address
		remove_column :orders, :mobile
		remove_column :orders, :email
		remove_column :orders, :last_name
		remove_column :orders, :first_name
	end
end
