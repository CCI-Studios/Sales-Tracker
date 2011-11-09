class Attempt < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :company
  belongs_to :user
  
  validates_presence_of :campaign_id
  validates_presence_of :company_id
  validates_presence_of :user_id
  
  default_scope :order => 'created_at DESC'
  scope :sales, where("value > 0")
  scope :emailed, where(:email => true)
  
  def campaign_name
    campaign.title if campaign
  end
  
  def campaign_name=(name)
    self.campaign = Campaign.find_by_title(name)
  end
  
  def company_name
    company.title if company
  end
  
  def company_name=(name)
    self.company = Company.find_by_title(name)
  end
  
  def year_day
    self.created_at.strftime('%Y %j')
  end
  
end



# == Schema Information
#
# Table name: attempts
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  email       :boolean
#  phone       :boolean
#  fax         :boolean
#  created_at  :datetime
#  updated_at  :datetime
#  company_id  :integer
#  campaign_id :integer
#  verbal      :boolean
#  value       :integer
#

