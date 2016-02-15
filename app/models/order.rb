class Order < ActiveRecord::Base
  attr_accessible :carrier, :delivery_date, :delivery_slot, :is_customer_pickup, :is_express_delivery, :order_currency, :order_no,
         :order_value, :payment_collection, :special_instruction, :tracking_no, :customer_id,
         :first_name, :last_name, :email, :mobile, :shipping_address, :line_items_attributes
  belongs_to :address
  belongs_to :customer
  #has_one :customer
 # has_one :address
  has_many :line_items
  accepts_nested_attributes_for :line_items     #, :address, :customer
  validates :carrier, :delivery_date, :delivery_slot, :order_currency, :order_no,
         :order_value, :payment_collection, :special_instruction, :tracking_no,
         :first_name, :last_name, :email, :mobile, :shipping_address, presence: true
end
