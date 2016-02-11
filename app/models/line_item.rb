class LineItem < ActiveRecord::Base
  attr_accessible :description, :order_id, :price, :product_id, :qty, :sku, :product_name
  belongs_to :product
  belongs_to :order
  validates :description, :price,  :qty, :sku, :product_name, presence: true
end
