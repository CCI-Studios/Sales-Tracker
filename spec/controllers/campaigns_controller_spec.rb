require 'spec_helper'

describe CampaignsController do
  render_views
  
  describe "for non-signed-in users" do	  
	  it "should deny access to show" do
	    campaign = Factory(:campaign)
		  get :show, :id => campaign.id
		  response.should redirect_to(new_user_session_path)
	  end
	  
	  it "should deny access to edit" do
	    campaign = Factory(:campaign)
		  get :edit, :id => campaign.id
		  response.should redirect_to(new_user_session_path)
	  end
	  
	  it "should deny access to new" do
		  get :new
		  response.should redirect_to(new_user_session_path)
	  end
	end

	describe "GET 'index'" do	
	  describe "for non-signed-in users" do
      it "should deny access to index" do
  		  get :index
  		  response.should redirect_to(new_user_session_path)
  	  end
	  end
	  
		describe "for signed-in users" do
		  before(:each) do
		    @user = test_sign_in(Factory(:user))
	    end
		  
			it "should be successful" do
			  get :index
			  response.should be_successful
		  end
		  
			it "should have the right title" do 
			  get :index
			  response.should have_selector(:title, :content => "Campaigns")
		  end
		  
			it "should have an element for each campaign"
			it "should have an element for each start date"
			it "should have an element for each end date"
			it "should have an element for each %"
			it "should have a new campaign link"
		end
	end
	
	describe "GET 'show'" do
	  describe "for non-signed-in users" do
      it "should deny access to index" do
  		  get :show
  		  response.should redirect_to(new_user_session_path)
  	  end
	  end
	  
		describe "for signed-in users" do
		  it "should be successful"	  
  		it "should find the right campaign"
  		it "should have the right title"
  		it "should include the campaign's name"
  		it "should have a start date"
  		it "should have an end date"
  		it "should have a revenue goal"
  		it "should have a revenue details section"
  		it "should have the total contacts"
  		it "should have the total sales"
  		it "should have the revenue/contact"
  		it "should have a contact details section"
  		it "should have the avg calls per active day"
  		it "should have the avg new calls per day"
  		it "should have the follow ups per active day"
  		it "should have the emails per day"
  		it "should have the contacts per sale"
  		it "should have the avg units per sale"
  		it "should have the avg unit duration"
  		it "should have a link back to the campaigns index"
		it "should redirect back to the index if the campaign doesn't exist"
		end
	end
		
	describe "GET 'new'" do
	  describe "for non-signed-in users" do
      it "should deny access to index" do
  		  get :new
  		  response.should redirect_to(new_user_session_path)
  	  end
	  end
	  
		describe "for signed-in users" do
		  it "should be successful"
  		it "should have the right title"
  		it "should have a title field"
  		it "should have a start date form"
  		it "should have an end date form"
  		it "should have a goal field"
  		it "should have a link back to the campaigns index"
		end
	end
	
	describe "POST 'create'" do
	  describe "for non-signed-in users" do
      it "should deny access to index" do
  		  post :create
  		  response.should redirect_to(new_user_session_path)
  	  end
	  end
	  
		describe "for signed-in users" do
		  describe "failure" do
  			it "should not create a campaign"
  			it "should have the right title"
  			it "should render the 'new' page"
  		end
		
  		describe "success" do
  			it "should create a campaign"
  			it "should redirect to the campaign show page"
  			it "should have a success message"
  		end
		end
		
	end
	
	describe "GET 'edit'" do
	  describe "for non-signed-in users" do
      it "should deny access to index" do
  		  get :edit
  		  response.should redirect_to(new_user_session_path)
  	  end
	  end
	  
		describe "for signed-in users" do
  		it "should be successful"
  		it "should have the right title"
  		it "should have a title field"
  		it "should have a start date form"
  		it "should have an end date form"
  		it "should have a goal field"
  		it "should have a link to the show page"
  		it "should have a link back to the campaigns page"
		it "should redirect back to the index if the company doesn't exist"
		end
	end
	
	describe "PUT 'update'" do
		describe "for non-signed-in users" do
      it "should deny access to index" do
  		  put :update
  		  response.should redirect_to(new_user_session_path)
  	  end
	  end
	  
		describe "for signed-in users" do
		  describe "failure" do
  			it "should render the 'edit' page"
  			it "should have the right title"
  		end
		
  		describe "success" do
  			it "should change the campaign's attributes"
  			it "should redirect to the campaign's show page"
  			it "should have a success message"
  		end
  	end
	end
	
	describe "DELETE 'destroy'" do
	  describe "for non-signed-in users" do
      it "should deny access to index" do
  		  get :destroy
  		  response.should redirect_to(new_user_session_path)
  	  end
	  end
    	  
		describe "as a non-admin user" do
			it "should protect the action"
		end

		describe "as an admin user" do
			it "should destroy the campaign"
			it "should redirect to the index"
		end
	end
end