class Sale < ActiveRecord::Base
  belongs_to :company
  belongs_to :campaign
  
  validates_presence_of :campaign_id
  validates_presence_of :company_id
  
  default_scope :order => "created_at DESC"
  
end
