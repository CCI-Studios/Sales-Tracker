require 'spec_helper'

describe Attempt do
  
  before(:each) do
    @attr = {
      :user         => Factory(:user),
      :company      => Factory(:company),
      :campaign     => Factory(:campaign),
      :value        => 0,
      :verbal       => false
    }
  end

  it "should create new instance given valid attributes" do
    Attempt.create!(@attr)
  end

  it "should require a user" do
    attempt = Attempt.new(@attr.merge(:user => nil))    
    attempt.should_not be_valid
  end

  it "should require a company" do
    attempt = Attempt.new(@attr.merge(:company => nil))    
    attempt.should_not be_valid
  end

  it "should require a campaign" do
    attempt = Attempt.new(@attr.merge(:campaign => nil))
    attempt.should_not be_valid
  end

  it "should have the right campaign given the a campaign name" do
    campaign = Factory(:campaign)
    attempt = Attempt.new(@attr.merge(:campaign => nil))
    attempt.campaign_name = campaign.title
    attempt.campaign.should == campaign
  end

  it "should have the right campaign title given the a campaign name" do
    campaign = Factory(:campaign)
    attempt = Attempt.new(@attr.merge(:campaign => nil))
    attempt.campaign_name = campaign.title
    attempt.campaign_name.should == campaign.title
  end

  it "should reject campaigns that do not exist" do
    attempt = Attempt.new(@attr.merge(:campaign => nil))
    attempt.campaign_name = "invald company"
    attempt.should_not be_valid
  end

  it "should have have the right company given a company name" do
    company = Factory(:company)
    attempt = Attempt.new(@attr.merge(:company => nil))
    attempt.company_name = company.title
    attempt.company.should == company
  end

  it "should have have the right company name given a company name" do
    company = Factory(:company)
    attempt = Attempt.new(@attr.merge(:company => nil))
    attempt.company_name = company.title
    attempt.company_name.should == company.title
  end

  it "should reject companies that do not exist"
  
  it "should have a appropriate year/date" do
    attempt = Attempt.create!(@attr)
    attempt.year_day.should == Time.new.strftime('%Y %j')
  end

  it "should reject values that are too large"
  it "should reject values that are negative"
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

