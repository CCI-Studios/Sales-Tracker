require 'spec_helper'

describe UserSessionsController do
  render_views

  describe "GET 'new'" do
    describe "for non-signed in users" do
      it "should be successful" do
        get :new
        response.should be_successful
      end
      
      it "should have the right title" do
        get :new
        response.should have_selector(:title, :content => "Sign in")
      end
    end
    
    describe "for signed in users" do
      before(:each) do
        test_sign_in(Factory(:user))
      end
      
      it "should not be successful" do
        get :new
        response.should redirect_to(root_path)
      end
    end
  end
  
  describe "POST 'create'" do
    describe "for non-signed in users" do
      describe "failure" do
        before(:each) do
          @attr = {
            :password => '1234',
            :password_confirmation => '4525'
          }
        end
        
        it "should have the right title" do
          post :create, :user_session => @attr
          response.should have_selector(:title, :content => "Sign in")
        end
        
        it "should not create a session" do
          post :create, :user_session => @attr
          UserSession.find.should be_nil
        end
        
        it "should render the 'new' template" do
          post :create, :user_session => @attr
          response.should render_template(:new)
        end
      end
      
      describe "success" do
        before(:each) do
          @user = Factory(:user)
          @attr = {
            :email  => @user.email,
            :password => @user.password,
            :password_confirmation => @user.password
          }
        end
          
        it "should redirect to the home page" do
          post :create, :user_session => @attr
          response.should redirect_to(root_path)
        end
        
        it "should log in the correct user" do
          post :create, :user_session => @attr
          UserSession.find.user.should == @user
        end
      end
    end
    
    describe "for signed in users" do
      before(:each) do
        @user = test_sign_in(Factory(:user))
      end
      
      it "should redirect to home page" do
        post :create, :user_session => { }
        response.should redirect_to(root_path)
      end
    end
  end
  
  describe "DELETE 'destroy'" do
    
    describe "for non-signed in users" do
      it "should redirect to signin page" do
        delete :destroy, :id => nil
        response.should redirect_to(new_user_session_path)
      end
    end
    
    describe "for signed in users" do
      before(:each) do
        @user = test_sign_in(Factory(:user))
      end
      
      it "should delete session" do
        delete :destroy, :id => @user
        UserSession.find.should be_nil
      end
      
      it "should redirect to home page" do
        delete :destroy, :id => @user
        response.should redirect_to(root_path)
      end
    end
  end
end
