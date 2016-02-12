class Customer < ActiveRecord::Base
	attr_accessible :email, :mobile, :first_name, :last_name
	attr_accessible :addresses_attributes
	has_many :addresses, :dependent => :destroy
	has_many :orders
	accepts_nested_attributes_for :addresses, :allow_destroy => true
	validates :email, :mobile, :first_name, :last_name,  presence: true
end
