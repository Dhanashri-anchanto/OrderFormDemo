class LineItem < ActiveRecord::Base
  attr_accessible :description, :order_id, :price, :product_id, :qty, :sku
  belongs_to :product
  belongs_to :order
end
