class Attempt < ActiveRecord::Base
  # associations
  belongs_to :campaign
  belongs_to :company
  belongs_to :user
  
  #validations
  validates_presence_of :campaign_id
  validates_presence_of :company_id
  validates_presence_of :user_id
  validates_numericality_of :value, :greater_than_or_equal_to => 0,
                                    :allow_nil => true
  
  #scopes
  scope :sales, where("value > 0")
  scope :emailed, where(:email => true)
  scope :reverse_chronological, order("created_at DESC")
  
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
  
  # returns a string which includes the year and day of year for an attempt
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

