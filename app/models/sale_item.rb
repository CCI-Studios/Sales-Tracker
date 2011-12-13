class SaleItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :sale
  
  validates :product_id, :presence => true
  
  scope :filter_products, lambda { |search|
    joins(:product).
    where('products.title LIKE ?', "%#{search}%")
  }
end
