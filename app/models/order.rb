class Order < ActiveRecord::Base
  attr_accessible :carrier, :delivery_date, :delivery_slot, :is_customer_pickup, :is_express_delivery, :order_currency, :order_no,
         :order_value, :payment_collection, :special_instruction, :tracking_no, :customer_id,
         :first_name, :last_name, :email, :mobile, :shipping_address,  :address_id,
        :line_items_attributes, :customer_attributes ,:address_attributes
  belongs_to :address  , :autosave => true  #, update_only: true
  belongs_to :customer , :autosave => true    #, update_only: true
  #has_one :customer
 #has_one :address
  has_many :line_items
  accepts_nested_attributes_for :line_items, :customer , :address
  validates :carrier, :delivery_date, :delivery_slot, :order_currency, :order_no,
         :order_value, :payment_collection, :special_instruction, :tracking_no,
           presence: true



  def autosave_associated_records_for_customer
    # Find or create the Customer by Email
    if new_customer = Customer.find_by_email( customer.email )
      new_customer.update_attributes( :first_name => customer.first_name,:last_name =>customer.last_name,:email => customer.email, :mobile => customer.mobile)
      self.customer = new_customer
          
    else
      self.customer.save!
    end
  end
  def autosave_associated_records_for_address
    # Find or create the address by id
    if new_address = (Address.where(:street_no => address.street_no, :street_name => address.street_name,:area_name => address.area_name,:landmark => address.landmark ,:postal_code => address.postal_code,:city => address.city,:state => address.state,:country => address.country).first rescue nil)
      #new_address.update_attributes(:street_no => address.street_no, :street_name => address.street_name,:area_name => address.area_name,:landmark => address.landmark ,:postal_code => address.postal_code,:city => address.city,:state => address.state,:country => address.country)
      self.address = new_address
    else
      self.address.save!
    end
  end
end
