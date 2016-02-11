class Product < ActiveRecord::Base
  attr_accessible :MFUPC, :avail_min_qty, :buffer_stock, :company, :cost_price, :depth, :height,
                   :is_sample, :merchant, :name, :retail_price,:sku, :storage_type, :weight, :width, :image
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
 validates :MFUPC, :avail_min_qty, :buffer_stock, :company, :cost_price, :depth, :height,
                   :merchant, :name, :retail_price,:sku, :storage_type, :weight, :width, :image, presence: true
  has_many :line_items
end
