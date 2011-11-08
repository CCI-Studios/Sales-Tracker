class Attempt < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :company
  belongs_to :user
  
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
#  id                           :integer         not null, primary key
#  user_id                      :integer
#  email                        :boolean
#  phone                        :boolean
#  fax                          :boolean
#  created_at                   :datetime
#  updated_at                   :datetime
#  company_id                   :integer
#  campaign_id                  :integer
#  success                      :boolean
#  value                        :integer
#  carrot                       :integer
#  off_campus                   :integer         default(0), not null
#  off_campus_featured          :integer         default(0), not null
#  restaurant                   :integer         default(0), not null
#  restaurant_featured          :integer         default(0), not null
#  services                     :integer         default(0), not null
#  services_featured            :integer         default(0), not null
#  email_blast                  :integer         default(0), not null
#  ads                          :integer         default(0), not null
#  off_campus_value             :integer         default(0), not null
#  off_campus_featured_value    :integer         default(0), not null
#  restaurant_value             :integer         default(0), not null
#  restaurant_featured_value    :integer         default(0), not null
#  services_value               :integer         default(0), not null
#  services_featured_value      :integer         default(0), not null
#  email_blast_value            :integer         default(0), not null
#  ads_value                    :integer         default(0), not null
#  off_campus_duration          :integer         default(0), not null
#  off_campus_featured_duration :integer         default(0), not null
#  restaurant_duration          :integer         default(0), not null
#  restaurant_featured_duration :integer         default(0), not null
#  services_duration            :integer         default(0), not null
#  services_featured_duration   :integer         default(0), not null
#

