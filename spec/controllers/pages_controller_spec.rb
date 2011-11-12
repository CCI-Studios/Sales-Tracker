require 'spec_helper'

describe PagesController do
  render_views

	describe "GET 'home'" do
		it "should be successful" do
		  get :home
		  response.should be_successful
	  end
	  
		it "should have the right title" do
		  get :home
		  response.should have_selector(:title, :content => "CCI Sales")
	  end
	end

	describe "GET 'release_notes'" do
	  
	  describe "non-signed in user" do
	    it "should deny access to release notes" do
	      get :release_notes
	      response.should_not be_successful
      end
      
      it "should redirect to signin page" do
        get :release_notes
        response.should redirect_to(new_user_session_path)
      end
	  end
	    
	  describe "signed in user" do
	    before(:each) do
	      test_sign_in(Factory(:user))
      end
	  
  		it "should be successful" do
  		  get :release_notes
  		  response.should be_successful
  	  end
	  
  		it "should have the right title" do
  		  get :release_notes
  		  response.should have_selector(:title, :content => "Release Notes")
  	  end
	  end
	end

end