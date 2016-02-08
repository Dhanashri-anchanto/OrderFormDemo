class Address < ActiveRecord::Base
  attr_accessible :area_name, :city, :country, :customer_id, :landmark, :postal_code, :state, :street_name, :street_no
  belongs_to :customer
 has_many :orders
end
