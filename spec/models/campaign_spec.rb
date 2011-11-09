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
    
	it "should reject names that are too long"
	it "should reject goals that are too large"
	
end
