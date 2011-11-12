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
  
  it "should reject campaign names that are too long"
  
  it "should require a company" do
    sale = Sale.new(@attr.merge(:company => nil))
    sale.should_not be_valid
  end
  
  it "should reject company names that are too long"
  it "should reject a company that has not been added"
  it "should require a total sale amount"
  it "should reject total sale amounts that are too large"
  it "should reject total sale values that are negative"
  it "should reject carrot values that are too long"
  it "should reject carrot values that are negative"
  it "should have at least one item"
  it "should reject off campus listing units that are too large"
  it "should reject off campus listing units that are negative"
  it "should reject off campus featured listing units that are too large"
  it "should reject off campus featured listing units that are negative"
  it "should reject restaurant listing units that are too large"
  it "should reject restaurant listing units that are negative"
  it "should reject restaurant featured listing units that are too large"
  it "should reject restaurant featured listing units that are negative"
  it "should reject service listing units that are too large"
  it "should reject service listing units that are negative"
  it "should reject service featured listing units that are too large"
  it "should reject service featured listing units that are negative"
  it "should reject ads units that are too large"
  it "should reject ads units that are negative"
  it "should reject email blasts units that are too large"
  it "should reject email blasts units that are negative"
  it "should reject off campus listing total values that are too large"
  it "should reject off campus listing total values that are negative"
  it "should reject off campus featured listing total values that are too large"
  it "should reject off campus featured listing total values that are negative"
  it "should reject restaurant listing total values that are too large"
  it "should reject restaurant listing total values that are negative"
  it "should reject restaurant featured listing total values that are too large"
  it "should reject restaurant featured listing total values that are negative"
  it "should reject service listing total values that are too large"
  it "should reject service listing total values that are negative"
  it "should reject service featured listing total values that are too large"
  it "should reject service featured listing total values that are negative"
  it "should reject ads total values that are too large"
  it "should reject ads total values that are negative"
  it "should reject email blasts total values that are too large"
  it "should reject email blasts total values that are negative"
  it "should reject off campus listing total durations that are too large"
  it "should reject off campus listing total durations that are negative"
  it "should reject off campus featured listing total durations that are too large"
  it "should reject off campus featured listing total durations that are negative"
  it "should reject restaurant listing total durations that are too large"
  it "should reject restaurant listing total durations that are negative"
  it "should reject restaurant featured listing total durations that are too large"
  it "should reject restaurant featured listing total durations that are negative"
  it "should reject service listing total durations that are too large"
  it "should reject service listing total durations that are negative"
  it "should reject service featured listing total durations that are too large"
  it "should reject service featured listing total durations that are negative"
  it "should have a link back to the index"
  
  
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

