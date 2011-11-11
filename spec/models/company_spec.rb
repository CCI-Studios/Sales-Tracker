require 'spec_helper'

describe Company do
  
  before(:each) do
    @attr = {
     :title         => "Company Name",
     :first_name    => "Joe",
     :last_name     => "Blow",
     :phone         => "(555) 555-5555",
     :email         => "user@example.com",
    }
  end
  
  it "should create a new instance given valid attributes" do
    Company.create!(@attr);
  end
  
  it "should require a title" do
    company = Company.new(@attr.merge(:title => ""))
    company.should_not be_valid
  end
  
  it "should reject duplicate titles" do
    Company.create!(@attr)
    company = Company.new(@attr)
    company.should_not be_valid
  end
  
  it "should reject duplicate titles up to case" do
    Company.create!(@attr.merge(:email => @attr[:email].upcase))
    company = Company.new(@attr)
    company.should_not be_valid
  end
  
  it "should require some form of contact"
  
  it "should allow nil email" do
    company = Company.new(@attr.merge(:email => nil))
    company.should be_valid
  end
  
  it "should allow blank email" do
    company = Company.new(@attr.merge(:email => ""))
    company.should be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.com first.last@foo.jp]
    addresses.each do |address|
      company = Company.new(@attr.merge(:email => address))
      company.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com cuser_at_foo.com first.last@foo.]
    addresses.each do |address|
      company = Company.new(@attr.merge(:email => address))
      company.should_not be_valid
    end
  end
  
  it "should accept valid phone numbers"
  it "should reject invalid phone numbers"
  
  describe "fullname" do
    it "should return the correct name" do
        company = Company.new(@attr)
        company.fullname.should == "Blow, Joe"
    end
    
    it "should have the right name if there is no first name" do
      company = Company.new(@attr.merge(:first_name => nil))
      company.fullname.should == "Blow"
    end
    
    it "should have the right name if there is no last name" do
      company = Company.new(@attr.merge(:last_name => nil))
      company.fullname.should == "Joe"
    end
  end
end
# == Schema Information
#
# Table name: companies
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  phone      :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#

