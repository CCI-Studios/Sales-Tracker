class Sale < ActiveRecord::Base
  after_initialize :set_default_values
  
  belongs_to :campaign
  belongs_to :company
  belongs_to :user
  
  has_many :sale_attrs, :through => :campaign
  
  validates_presence_of :campaign_id
  validates_presence_of :company_id
  validates_presence_of :user_id
  serialize :values
  
  scope :reverse_chronological, order("created_at DESC")
  
  def year_day
    self.created_at.strftime('%Y %j')
  end
  
  private
    def set_default_values
      self.values ||= {}
    end

end



# == Schema Information
#
# Table name: sales
#
#  id          :integer         not null, primary key
#  total       :integer
#  company_id  :integer
#  campaign_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#  values      :text            default("'")
#

