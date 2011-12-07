class SaleAttr < ActiveRecord::Base
  belongs_to :campaign
end

# == Schema Information
#
# Table name: sale_attrs
#
#  id          :integer         not null, primary key
#  campaign_id :integer
#  title       :string(255)
#  kind        :integer
#  default     :string(255)
#  required    :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

