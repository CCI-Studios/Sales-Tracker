class Sale < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :company
  belongs_to :user
  has_many :sale_items
  
  accepts_nested_attributes_for :sale_items, :allow_destroy => true, :reject_if => lambda { |a| a[:product_id].blank? }
  
  validates_presence_of :campaign_id
  validates_presence_of :company_id
  validates_presence_of :user_id
  validates_numericality_of :total, :greater_than_or_equal_to => 0
  serialize :values
  
  scope :reverse_chronological, order("created_at DESC")
  
  def year_day
    self.created_at.strftime('%Y %j')
  end
end


# == Schema Information
#
# Table name: sales
#
#  id                           :integer         primary key
#  total                        :integer
#  company_id                   :integer
#  campaign_id                  :integer
#  created_at                   :timestamp
#  updated_at                   :timestamp
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
#  off_campus_carrots           :integer         default(0), not null
#  restaurant_carrots           :integer         default(0), not null
#  service_carrots              :integer         default(0), not null
#  values                       :text
#

