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
  
  it "should require a total sale amount" do
    sale = Sale.new(@attr.merge(:total => nil))
    sale.should_not be_valid
  end
  
  it "should reject total sale values that are negative" do
    sale = Sale.new(@attr.merge(:total => -100))
    sale.should_not be_valid
  end
  
  describe "associations" do
    before(:each) do
      @sale = Sale.new(@attr)
    end
    
    it "should respond to campaign" do
      @sale.should respond_to(:campaign)
    end
    
    it "should respond to company" do
      @sale.should respond_to(:company)
    end
    
    it "should respond to user" do
      @sale.should respond_to(:user)
    end
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

