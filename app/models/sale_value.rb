class SaleValue < ActiveRecord::Base
  belongs_to :sale_attr
  belongs_to :sale
end
