class ToRemoveColumnFromCustomers < ActiveRecord::Migration
  def up
  	remove_column :customers, :permalink
  end

  def down
  	add_column :customers, :permalink, :string
  end
end
