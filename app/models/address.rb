class Address < ActiveRecord::Base
  attr_accessible :area_name, :city, :country, :customer_id, :landmark, :postal_code, :state, :street_name, :street_no
  belongs_to :customer
 has_many :orders
 #belongs_to :order
 validates :area_name, :city, :country, :landmark, :postal_code, :state, :street_name, :street_no, presence: true
 validates :street_no, numericality:  true 
end
