class Customer < ActiveRecord::Base
	attr_accessible :email, :mobile, :first_name, :last_name
	attr_accessible :addresses_attributes  #, :orders_attributes
	#has_permalink :first_name

	has_many :addresses, :dependent => :destroy
	has_many :orders
	accepts_nested_attributes_for :addresses
	#accepts_nested_attributes_for :orders
validates :email, :mobile, :first_name, :last_name,  presence: true



# def self.search(search)
#   if search
#     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
#   else
#     find(:all)
#   end
# end


end
