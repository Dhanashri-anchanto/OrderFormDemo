class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.integer :street_no
      t.string :street_name
      t.string :area_name
      t.string :landmark
      t.string :city
      t.string :postal_code
      t.string :state
      t.string :country
      

      t.timestamps
    end
    add_index :addresses, :customer_id
  end
end
