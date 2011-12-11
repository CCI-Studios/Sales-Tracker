require 'spec_helper'

describe SalesController do
  render_views
  
  before(:each) do
    8.times { Campaign.create!(:title => Factory.next(:title)) }
  end
  
  describe "GET 'index'" do
  	describe "for non-signed-in users" do
  		it "should redirect to the signin page" do
  		  get :index
  		  response.should_not be_successful
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
  		  response.should have_selector(:title, :content => "Sales")
		  end
		  
  		it "should have an element for each sale's total"
  		it "should paginate sales"
  		it "should have an element for each company"
  		it "should have an element for each campaign"
  		it "should have a show link for each sale"
  		it "should have an edit link for each sale"
  	end
  end

  describe "GET 'show'" do
    before(:each) do
      @sale = Factory(:sale)
    end
    
	  describe "for non-signed-in users" do
  			it "should redirect to the signin page" do
  			  get :show, :id => @sale
  			  response.should redirect_to(new_user_session_path)
			  end
		end
		
  	describe "for signed-in users" do
  	  before(:each) do
  	    test_sign_in(Factory(:user))
	    end
	    
  		it "should be successful" do
  		  get :show, :id => @sale
  		  response.should be_successful
		  end
		  
  		it "should find the right sale" do
  		  get :show, :id => @sale
  		  assigns(:sale).should == @sale
		  end
  		  
  		it "should have the right title" do 
  		  get :show, :id => @sale
  		  response.should have_selector(:title, :content => "Sale ##{@sale.id}")
		  end
		  
  		it "should have the company's name"
  		it "should have the campaign"
  		it "should have the total"
  		it "should have the carrot"
  		it "should have the sale details table"
  		it "should have a link to the edit page"
  		it "should have a link back to the index"
  		it "should redirect back to the index if the sale doesn't exist"
  	end
  end

  describe "GET 'new'" do
  	describe "for non-signed-in users" do
  			it "should redirect to the signin page" do
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
  		  response.should have_selector(:title, :content => "New Sale")
		  end
		  
  		it "should have a field for the campaign name"
  		it "should have a field for the company name"
  		it "should have a field for the sale total"
  		it "should have a field for the carrot"
  		it "should have fields for the sale details"
  		it "should have a link back to the index"
  	end
  end

  describe "POST 'create'" do
  	describe "for non-signed-in users" do
  			it "should redirect to the signin page" do
  			  post :create, :sale => {}
  			  response.should redirect_to(new_user_session_path)
			  end
  	end
  	
  	describe "for signed-in users" do
  	  before(:each) do
  	    @user = test_sign_in(Factory(:user))
      end
      
  		describe "failure" do
  		  before(:each) do
  		    @attr = {
            :total => nil,
            :campaign => nil,
            :company => nil,
            :user => nil
          }
        end
        
  			it "should have the right title" do
  			  post :create, :sale => @attr
  			  response.should have_selector(:title, :content => "New Sale")
			  end
			  
  			it "should render the 'new' page" do
  			  post :create, :sale => @attr
  			  response.should render_template(:new)
			  end
			  
  			it "should not create a sale" do
  			  lambda do
  			    post :create, :sale => @attr
			    end.should_not change(Sale, :count)
		    end
  		end

  		describe "success" do
  		  before(:each) do
  		    @attr = {
            :total => 1000,
            :campaign => Factory(:campaign),
            :company => Factory(:company),
            :user => @user
          }
        end
        
  			it "should create a sale" do
  			  lambda do
  			    post :create, :sale => @attr
			    end.should change(Sale, :count).by(1)
		    end
		    
  			it "should redirect to the sale show page" do
  			  post :create, :sale => @attr
  			  response.should redirect_to(sale_path(assigns(:sale)))
			  end
			  
  			it "should dislay a success message" do
  			  post :create, :sale => @attr
  			  flash[:success].should =~ /sale successfully created/i
			  end
  		end
	  end
  end

  describe "GET 'edit'" do
    before(:each) do
      @sale = Factory(:sale)
    end
    
  	describe "for non-signed-in users" do
  			it "should redirect to the signin page" do
  			  get :edit, :id => @sale
  			  response.should redirect_to(new_user_session_path)
			  end
  	end
  	
  	describe "for signed-in users" do
  	  before(:each) do
  	    test_sign_in(Factory(:user))
	    end
	    
  		it "should be successful" do 
  		  get :edit, :id => @sale
  		  response.should be_successful
		  end
		  
  		it "should have the right title" do 
  		  get :edit, :id => @sale
  		  response.should have_selector(:title, :content => "Editing Sale")
		  end
		  
  		it "should have a field for the campaign name"
  		it "should have a field for the company name"
  		it "should have a field for the sale total"
  		it "should have a field for the carrot"
  		it "should have fields for the sale details"
  		it "should have a link to the show page"
  		it "should have a link back to the index"
  		it "should redirect back to the index if the sale doesn't exist"
  	end
  end

  describe "PUT 'update'" do
    before(:each) do
      @sale = Factory(:sale)
    end
    
  	describe "for non-signed-in users" do
  			it "should redirect to the signin page" do
  			  put :update, :id => @sale, :sale => {}
  			  response.should redirect_to(new_user_session_path)
			  end
  	end
  	
  	describe "for signed-in users" do
      before(:each) do
        @user = test_sign_in(Factory(:user))
      end
      
  		describe "failure" do
  			it "should render the 'edit' page" do
  			  put :update, :id => @sale, :sale => { :company => nil, :campaign => nil }
  			  response.should render_template(:edit)
			  end
			  
  			it "should have the right title" do
  			  put :update, :id => @sale, :sale => { :company => nil, :campaign => nil }
  			  response.should have_selector(:title, :content => "Editing Sale")
			  end
  		end

  		describe "success" do
        before(:each) do
          @attr = {
            :campaign => Factory(:campaign),
            :company => Factory(:company),
            :user => @user
          }
        end
        
  			it "should change the sale's attributes" do
  			  put :update, :id => @sale, :sale => @attr
  			  @sale.reload
  			  @sale.campaign = @attr[:campaign]
  			  @sale.company = @attr[:company]
  			  @sale.user = @attr[:user]
			  end
			  
  			it "should display a success message" do
  			  put :update, :id => @sale, :sale => @attr
          flash[:success].should =~ /sale successfully updated/i
        end
  		end
  	end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @sale = Factory(:sale)
    end
    
  	describe "for non-signed-in users" do
  			it "should redirect to the signin page" do
  			  delete :destroy, :id => @sale
  			  response.should redirect_to(new_user_session_path)
			  end
			  
			  it "should not delete the sale" do
  		    lambda do
  		      delete :destroy, :id => @sale
  	      end.should_not change(Sale, :count)
        end
  	end
  	
  	describe "for signed-in users" do
  	  before(:each) do
  	    @user = test_sign_in(Factory(:user))
	    end
	    
  		describe "for a non-admin user" do
  			it "should redirect to the root path" do
  			  delete :destroy, :id => @sale
  			  response.should redirect_to(root_path)
			  end
			  
        it "should not delete the sale" do
  		    lambda do
  		      delete :destroy, :id => @sale
  	      end.should_not change(Sale, :count)
        end
  		end

  		describe "for an admin user" do
  		  before(:each) do
  		    @user.admin = true
		    end
		    
  			it "should destroy the sale" do
  			  lambda do
  			    delete :destroy, :id => @sale
			    end.should change(Sale, :count).by(-1)
		    end
		    
  			it "should redirect to the index" do
  			  delete :destroy, :id => @sale
  			  response.should redirect_to(sales_path)
			  end
  		end
  	end
  end
end
