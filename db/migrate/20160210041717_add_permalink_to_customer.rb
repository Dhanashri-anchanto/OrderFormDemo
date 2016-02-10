class AddPermalinkToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :permalink, :string
    add_index :customers, :permalink
  end
  def self.down
    remove_column :customers, :permalink
  end
end