require 'spec_helper'

describe Sale do
  before(:each) do
    @attr = {
      :campaign => Factory(:campaign),
      :company  => Factory(:company),
      :total    => 1000,
      :user     => Factory(:user)
    }
  end
  
  it "should create new instance given valid attributes" do
    Sale.create!(@attr)    
  end
  
  it "should require a campaign" do
    sale = Sale.new(@attr.merge(:campaign => nil))
    sale.should_not be_valid
  end
  
  it "should require a company" do
    sale = Sale.new(@attr.merge(:company => nil))
    sale.should_not be_valid
  end
  
  it "should require a user" do
    sale = Sale.new(@attr.merge(:user => nil))
    sale.should_not be_valid
  end
  
  it "should have a appropriate year/date" do
    sale = Sale.create!(@attr)
    sale.year_day.should == Time.new.strftime('%Y %j')
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

