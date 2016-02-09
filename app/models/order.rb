class Order < ActiveRecord::Base
  attr_accessible :carrier, :delivery_date, :delivery_slot, :is_customer_pickup, :is_express_delivery, :order_currency, :order_no,
         :order_value, :payment_collection, :special_instruction, :tracking_no, :line_items_attributes, :customer_id
  belongs_to :address
  has_many :line_items
  accepts_nested_attributes_for :line_items
end
