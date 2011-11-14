require 'spec_helper'

describe CampaignsController do
  render_views

	describe "GET 'index'" do	
	  describe "for non-signed-in users" do
      it "should deny access to index" do
  		  get :index
  		  response.should redirect_to(new_user_session_path)
  	  end
	  end
	  
		describe "for signed-in users" do
		  before(:each) do
		    test_sign_in(Factory(:user))
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
	  before(:each) do
	    @campaign = Factory(:campaign)
    end
	  
	  describe "for non-signed-in users" do
      it "should deny access to show" do
  		  get :show, :id => @campaign
  		  response.should redirect_to(new_user_session_path)
  	  end
	  end
	  
		describe "for signed-in users" do
		  before(:each) do
		    test_sign_in(Factory(:user))
	    end
		  
		  it "should be successful"	do
		    get :show, :id => @campaign
		    response.should be_successful
	    end
	    
  		it "should find the right campaign"
  		
  		it "should have the right title" do
  		  get :show, :id => @campaign
  		  response.should have_selector(:title, :content => @campaign.title)
		  end
		  
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
		  before(:each) do
		    test_sign_in(Factory(:user))
	    end
		  
		  it "should be successful" do
		    get :new
		    response.should be_successful
	    end
	    
  		it "should have the right title" do
  		  get :new
  		  response.should have_selector(:title, :content => "New Campaign")
		  end
		  
  		it "should have a title field"
  		it "should have a start date form"
  		it "should have an end date form"
  		it "should have a goal field"
  		it "should have a link back to the campaigns index"
		end
	end
	
	describe "POST 'create'" do
	  before(:each) do
	    @attr = {
        :title => "campaign name"
	    }
	  end
	  
	  describe "for non-signed-in users" do
      it "should deny access to index" do
  		  post :create, :campaign => @attr
  		  response.should redirect_to(new_user_session_path)
  	  end
	  end
	  
		describe "for signed-in users" do
		  before(:each) do
		    test_sign_in(Factory(:user))
	    end
	    
		  describe "failure" do
		    before(:each) do
		      @attr = { :title => nil }
	      end
	      
  			it "should not create a campaign" do
  			  lambda do
  			    post :create, :campaign => @attr
  			  end.should_not change(Campaign, :count)
			  end
  			
  			it "should have the right title" do
  			  post :create, :campaign => @attr
  			  response.should have_selector(:title, :content => "New Campaign")
			  end
			  
  			it "should render the 'new' page" do
  			  post :create, :campaign => @attr
  			  response.should render_template(:new)
			  end
  		end
		
  		describe "success" do
  		  before(:each) do
  		    @attr = { :title => "campaign title" }
		    end
  		  
  			it "should create a campaign" do
  			  lambda do
  			    post :create, :campaign => @attr
			    end.should change(Campaign, :count).by(1)
  			end  
  			  
  			it "should redirect to the campaign show page" do
  			  post :create, :campaign => @attr
  			  response.should redirect_to(campaign_path(assigns(:campaign)))
			  end
			  
  			it "should have a success message" do
  			  post :create, :campaign => @attr
  			  flash[:success].should =~ /campaign successfully created/i
  			end
  		end
		end
	end
	
	describe "GET 'edit'" do
	  before(:each) do
	    @campaign = Factory(:campaign)
    end
    
	  describe "for non-signed-in users" do
      it "should deny access to index" do
  		  get :edit, :id => @campaign
  		  response.should redirect_to(new_user_session_path)
  	  end
	  end
	  
		describe "for signed-in users" do
		  before(:each) do
		    test_sign_in(Factory(:user))
		    @campaign = Factory(:campaign)
	    end
	    
  		it "should be successful" do
  		  get :edit, :id => @campaign
  		  response.should be_successful
		  end
		  
  		it "should have the right title" do
  		  get :edit, :id => @campaign
  		  response.should have_selector(:title, :content => "Editing Campaign")
		  end
		  
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
	  before(:each) do
	    @campaign = Factory(:campaign)
    end
	  
		describe "for non-signed-in users" do
      it "should deny access to index" do
  		  put :update, :id => @campaign
  		  response.should redirect_to(new_user_session_path)
  	  end
	  end
	  
		describe "for signed-in users" do
		  before(:each) do
		    test_sign_in(Factory(:user))
		    @campaign = Factory(:campaign)
	    end
	    
		  describe "failure" do
		    before(:each) do
		      @attr = { :title => "" }
	      end
	      
  			it "should render the 'edit' page" do
  			  put :update, :id => @campaign, :campaign => @attr
  			  response.should render_template(:edit)
			  end
  			  
  			it "should have the right title" do
  			  put :update, :id => @campaign, :campaign => @attr
  			  response.should have_selector(:title, :content => "Editing Campaign")
			  end
  		end
		
  		describe "success" do
  		  before(:each) do
  		    @attr = { :title => Factory.next(:title) }
		    end
		    
  			it "should change the campaign's attributes" do
  			  put :update, :id => @campaign, :campaign => @attr
  			  @campaign.reload
  			  @campaign.title.should == @attr[:title]
			  end
			  
  			it "should redirect to the campaign's show page" do
  			  post :update, :id => @campaign, :campaign => @attr
  			  response.should redirect_to(campaign_path(assigns(:campaign)))
			  end
			  
  			it "should have a success message" do
  			  post :update, :id => @campaign, :campaign => @attr
          flash[:success].should =~ /campaign successfully updated/i
        end
  		end
  	end
	end
	
	describe "DELETE 'destroy'" do
	  before(:each) do
	    @campaign = Factory(:campaign)
    end
	  
	  describe "for non-signed-in users" do
      it "should deny access to index" do
  		  delete :destroy, :id => @campaign
  		  response.should redirect_to(new_user_session_path)
  	  end
  	  
  	  it "should not delete the campaign" do
		    lambda do
		      delete :destroy, :id => @campaign
	      end.should_not change(Campaign, :count)
      end
	  end
    	  
		describe "as a non-admin user" do
		  before(:each) do
		    test_sign_in(Factory(:user))
	    end
	    
			it "should protect the action" do
			  delete :destroy, :id => @campaign
			  response.should redirect_to(root_path)
		  end
		  
		  it "should not delete the campaign" do
		    lambda do
		      delete :destroy, :id => @campaign
	      end.should_not change(Campaign, :count)
      end
		end

		describe "as an admin user" do
		  before(:each) do
		    @user = test_sign_in(Factory(:user))
		    @user.admin = true
	    end
	    
			it "should destroy the campaign" do 
			  lambda do
			    delete :destroy, :id => @campaign
		    end.should change(Campaign, :count).by(-1)
	    end
		  
			it "should redirect to the index" do
			  delete :destroy, :id => @campaign
			  response.should redirect_to(campaigns_path)
		  end
		end
	end
end