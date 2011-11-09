require 'spec_helper'

describe CampaignsController do
  render_views

	describe "GET 'index'" do
	
		describe "for non-signed-in users" do
			it "should deny access" do
			  get :index
			  response.should redirect_to(new_user_session_path)
		  end
		end
			
		describe "for signed-in users" do
			it "should be successful"
			it "should have the right title"
			it "should have an element for each campaign"
			it "should have an element for each start date"
			it "should have an element for each end date"
			it "should have an element for each %"
			it "should have a new campaign link"
		end
	end
	
	describe "GET 'show'" do
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
	end
		
	describe "GET 'new'" do
		it "should be successful"
		it "should have the right title"
		it "should have a title field"
		it "should have a start date form"
		it "should have an end date form"
		it "should have a goal field"
		it "should have a link back to the campaigns index"
	end
	
	describe "POST 'create'" do
		
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
	
	describe "GET 'edit'" do
		it "should be successful"
		it "should have the right title"
		it "should have a title field"
		it "should have a start date form"
		it "should have an end date form"
		it "should have a goal field"
		it "should have a link to the show page"
		it "should have a link back to the campaigns page"
	end
	
	describe "PUT 'update'" do
		
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