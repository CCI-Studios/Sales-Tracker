class Sale < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :company
  belongs_to :user
  
  has_many :sale_attrs, :through => :campaign
  has_many :sale_values
  
  has_eav :attributes => :sale_attrs, :values => :sale_values
  
  validates_presence_of :campaign_id
  validates_presence_of :company_id
  validates_presence_of :user_id
  
  scope :reverse_chronological, order("created_at DESC")
  
  def year_day
    self.created_at.strftime('%Y %j')
  end
end

# == Schema Information
#
# Table name: sales
#
#  id                           :integer         not null, primary key
#  total                        :integer
#  company_id                   :integer
#  campaign_id                  :integer
#  created_at                   :datetime
#  updated_at                   :datetime
#  user_id                      :integer
#  carrot                       :integer
#  off_campus                   :integer         default(0), not null
#  off_campus_value             :integer         default(0), not null
#  off_campus_duration          :integer         default(0), not null
#  off_campus_featured          :integer         default(0), not null
#  off_campus_featured_value    :integer         default(0), not null
#  off_campus_featured_duration :integer         default(0), not null
#  restaurant                   :integer         default(0), not null
#  restaurant_value             :integer         default(0), not null
#  restaurant_duration          :integer         default(0), not null
#  restaurant_featured          :integer         default(0), not null
#  restaurant_featured_value    :integer         default(0), not null
#  restaurant_featured_duration :integer         default(0), not null
#  services                     :integer         default(0), not null
#  services_value               :integer         default(0), not null
#  services_duration            :integer         default(0), not null
#  services_featured            :integer         default(0), not null
#  services_featured_value      :integer         default(0), not null
#  services_featured_duration   :integer         default(0), not null
#  email_blast                  :integer         default(0), not null
#  email_blast_value            :integer         default(0), not null
#  ads                          :integer         default(0), not null
#  ads_value                    :integer         default(0), not null
#

