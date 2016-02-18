class Customer < ActiveRecord::Base
	attr_accessible :email, :mobile, :first_name, :last_name
	attr_accessible :addresses_attributes
	has_many :addresses, :dependent => :destroy
	has_many :orders
	accepts_nested_attributes_for :addresses, :allow_destroy => true
	validates :email, :mobile, :first_name, :last_name,  presence: true
	validates :mobile, numericality: true
	#validates_uniqueness_of :email
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


	def autosave_associated_records_for_address
    # Find or create the address by id
    if new_addresses = (Address.where(:street_no => address.street_no, :street_name => address.street_name,:area_name => address.area_name,:landmark => address.landmark ,:postal_code => address.postal_code,:city => address.city,:state => address.state,:country => address.country).first rescue nil)
      self.addresses = new_addresses
    else
      self.addresses.save!
    end
  end
end
