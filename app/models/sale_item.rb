class SaleItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :sale
  
  scope :filter_products, lambda { |search|
    joins(:product).
    where('products.title LIKE ?', "%#{search}%")
  }
end
