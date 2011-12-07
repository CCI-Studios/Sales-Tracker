class SaleAttr < ActiveRecord::Base
  belongs_to :campaign
  
  def key
    title.downcase.gsub('[^a-z ]', '').gsub(' ', '_')
  end
  
  def path
    return title if collection.blank?
    "#{collection} :: #{title}"
  end
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
#  collection  :string(255)
#

