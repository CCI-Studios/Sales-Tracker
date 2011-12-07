class SaleAttr < ActiveRecord::Base
  has_many :sale_values
  
  belongs_to :campaign
end
