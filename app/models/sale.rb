class Sale < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :company
  belongs_to :user
  
  
  validates_presence_of :campaign_id
  validates_presence_of :company_id
  
  default_scope :order => "created_at DESC"
  
  def year_day
    self.created_at.strftime('%Y %j')
  end
end
