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

