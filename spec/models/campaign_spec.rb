require 'spec_helper'

describe Campaign do
  
  before(:each) do 
    @attr = {
      :title      => "Campaign Title",
      :start_date => "2011-11-10 10:30:30",
      :end_date   => "2011-12-10 10:30:30"
    }
  end
  
  it "should create a new instance given valid attributes" do
    Campaign.create!(@attr)
  end
  
  it "should require a title" do
    c = Campaign.new(@attr.merge(:title => ""))
    c.should_not be_valid
  end
  
  it "should reject duplicate titles" do
    Campaign.create!(@attr)
    c = Campaign.new(@attr)
    c.should_not be_valid
  end
  
  it "should reject duplicate titles up to case" do
    Campaign.create!(@attr)
    c = Campaign.new(@attr.merge(:title => @attr[:title].upcase))
    c.should_not be_valid
  end
    
	it "should reject names that are too long"
	it "should reject goals that are too large"
	
	it "should reject goats that are negative" do
	  c = Campaign.new(@attr)
	  c.goal = -1000
	  c.should_not be_valid
  end
	
	describe "calculations" do
	  before(:each) do
	    @campaign = Factory(:campaign)
	    @campaign.goal = 9000
	    
      @c1 = Factory(:company)
      @c2 = Factory(:company)
      @c3 = Factory(:company)
    
      @a1 = Factory(:attempt, 
                    :company => @c1, 
                    :campaign => @campaign,
                    :email => true)
      @a2 = Factory(:attempt, 
                    :company => @c1, 
                    :campaign => @campaign)
      @a3 = Factory(:attempt, 
                    :company => @c1,
                    :campaign => @campaign, 
                    :email => true)
      @a4 = Factory(:attempt, 
                    :company => @c2, 
                    :campaign => @campaign)
      @a5 = Factory(:attempt, 
                    :company => @c3,
                    :campaign => @campaign)
      @a6 = Factory(:attempt,
                    :company => @c3, 
                    :campaign => @campaign,
                    :email => true)
      
      @s1 = Factory(:sale,  :company => @c1, 
                            :campaign => @campaign, 
                            :total => 1000,
                            :off_campus => 1,
                            :off_campus_duration => 12,
                            :off_campus_value => 1000)
      @s2 = Factory(:sale,  :company => @c2, 
                            :campaign => @campaign, 
                            :total => 2000, 
                            :restaurant => 1,
                            :restaurant_value => 1000,
                            :restaurant_duration => 12,
                            :email_blast => 1,
                            :email_blast_value => 1000)
      @s3 = Factory(:sale,  :company => @c2, 
                            :campaign => @campaign, 
                            :total => 1500, 
                            :restaurant_featured => 1,
                            :restaurant_featured_value => 2500,
                            :restaurant_featured_duration => 6)
    end
	  
  	it "should return correct goal percent when there is no goal" do
      @campaign.goal = nil
  	  @campaign.goal_percent.should == '-'
    end
    
    it "should have the correct total revenue" do
      @campaign.total_revenue.should == 4500
    end
  
    it "should return correct goal percent when there is a goal" do
      @campaign.goal_percent.should == 50.0
    end
  
    it "should return correct initial attempts" do
      (@campaign.initial_contacts - [@a1, @a4, @a5]).should == []
    end
    
    it "should return attempts with emails" do
      (@campaign.attempts_with_email - [@a1, @a3, @a6]).should == []
    end
    
    it "should have the correct total duration" do
      @campaign.total_duration.should == 30
    end
    
    it "should have the correct total units" do
      @campaign.total_units.should == 4
    end
    
    it "should have the correct total listings" do
      @campaign.total_listings.should == 3
    end
  end
end

# == Schema Information
#
# Table name: campaigns
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#  goal       :integer
#

