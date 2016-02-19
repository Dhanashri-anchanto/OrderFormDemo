class Order < ActiveRecord::Base
  attr_accessible :carrier, :delivery_date, :delivery_slot, :is_customer_pickup, :is_express_delivery, :order_currency, :order_no,
         :order_value, :payment_collection, :special_instruction, :tracking_no, :customer_id,
         :first_name, :last_name, :email, :mobile, :shipping_address,  :address_id,
        :line_items_attributes, :customer_attributes ,:address_attributes
  belongs_to :address  , :autosave => true 
  belongs_to :customer , :autosave => true 
  has_many :line_items
  accepts_nested_attributes_for :line_items, :customer , :address
  validates :carrier, :delivery_date, :delivery_slot, :order_currency, :order_no,
         :order_value, :payment_collection, :special_instruction, :tracking_no,
           presence: true


  def customer_attributes=(attrs)
    self.customer = Customer.where(attrs).first_or_initialize(attrs) 
    @show_exists_message = !customer.new_record?
  end


  def address_attributes=(attrs)
    self.address = Address.where(attrs).first_or_initialize(attrs) 
    @show_exists_message = !address.new_record?
  end
end
