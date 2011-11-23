require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
      :email    => "foo@bar.com",
      :password => "foobar",
      :password_confirmation  => "foobar"
    }
  end
  
  describe "admin attribute" do
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should respond to admin" do
      @user.should respond_to(:admin)
    end
    
    it "should not be an admin by default" do
      @user.should_not be_admin
    end
    
    it "should be convertible to an admin" do
      @user.toggle!(:admin)
      @user.should be_admin
    end
  end
  
  describe "attempt associations" do
    before(:each) do
      @user = User.create!(@attr)
      @a1 = Factory(:attempt, :user => @user, :created_at => 1.day.ago)
      @a2 = Factory(:attempt, :user => @user, :created_at => 1.hour.ago)
    end
    
    it "should have an attempts attribute" do
      @user.should respond_to(:attempts)
    end
    
    it "should the right attempts in the right order" do
      @user.attempts.should == [@a1, @a2]
    end
    
    it "should destroy associated attempts"
  end
  
  it "should respond to companies"
  
end
