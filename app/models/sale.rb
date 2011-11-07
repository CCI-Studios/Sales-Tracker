class Sale < ActiveRecord::Base
  belongs_to :company
  belongs_to :campaign
  
  validates_presence_of :campaign_id
end
