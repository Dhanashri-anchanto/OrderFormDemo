class Customer < ActiveRecord::Base
	attr_accessible :email, :mobile, :name
	attr_accessible :addresses_attributes , :orders_attributes

	has_many :addresses, :dependent => :destroy
	has_many :orders
	accepts_nested_attributes_for :addresses
	accepts_nested_attributes_for :orders
end
