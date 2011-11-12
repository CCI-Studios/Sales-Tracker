require 'spec_helper'

describe CompaniesController do
  render_views
	
	describe "GET 'index'" do
		describe "for non-signed-in users" do
			it "should deny access" do
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
			  response.should have_selector(:title, :content => "Companies")
		  end
		  
			it "should have an element for each company"
			it "should paginate companies"
			it "should have an element for each contact name"
			it "should have an element for each phone number"
			it "should have an element for each last contact"
			it "should have an element to show each company"
			it "should have an element to edit each company"
			it "should have an element to destroy each company"
			it "should have a new company link"
		end
	end
		
	describe "GET 'show'" do
	  before(:each) do
	    @company = Factory(:company)
    end
	  
		describe "for non-signed-in users" do
			it "should deny access" do
			  get :show, :id => @company
			  response.should_not be_successful
		  end
		end
		
		describe "for signed-in users" do
		  before(:each) do
		    test_sign_in(Factory(:user))
	    end
	    
			it "should be successful" do
			  get :show, :id => @company
			  response.should be_successful
		  end
		  
			it "should find the right company" do
			  get :show, :id => @company
			  assigns(:company).should == @company
		  end
		  
			it "should have the right title" do
			  get :show, :id => @company
			  response.should have_selector(:title, :content => "#{@company.title}")
		  end
		  
			it "should have the company name"
			it "should have the contact name"
			it "should have the phone number"
			it "should have the email"
			it "should have the last contact date"
			it "should have a link to last contact details"
			it "should have a link to edit the company"
			it "should have a link to go back to the index"
			it "should redirect back to the index if the company doesn't exist"
		end
	end
	
	describe "GET 'new'" do
	  before(:each) do
	    @attr = { :title => Factory.next(:title) }
    end
	  
		describe "for non-signed-in users" do
			it "should deny access" do
			  get :new
			  response.should_not be_successful
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
			  response.should have_selector(:title, :content => "New Company")
		  end
		end
	end
	
	describe "POST 'create'"
	
	describe "GET 'edit'" do
	  before(:each) do
	    @company = Factory(:company)
    end
    
		describe "for non-signed-in users" do
			it "should deny access" do
			  get :edit, :id => @company
			  response.should_not be_successful
		  end
		end
		
		describe "for signed-in users" do
		  before(:each) do
		    test_sign_in(Factory(:user))
	    end
	    
			it "should be successful" do
			  get :edit, :id => @company
			  response.should be_successful
		  end
		  
			it "should have the right title" do
			  get :edit, :id => @company
			  response.should have_selector(:title, :content => "Editing Company")
		  end
		  
			it "should have a title field"
			it "should have a first name field"
			it "should have a last name field"
			it "should have a phone number field"
			it "should have an email field"
			it "should have a link to the the show page"
			it "should have a link back to the index"
			it "should redirect back to the index if the company doesn't exist"
		end
	end
	
	describe "PUT 'update'" do
	  before(:each) do
	    @company = Factory(:company)
    end
    
		describe "for non-signed-in users" do
		  before(:each) do
		    @attr = { :title => Factory.next(:title) }
	    end
	    
			it "should deny access" do
			  put :update, :id => @company, :company => @attr
			  response.should_not be_successful
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
			  
				it "should render the 'edit' page" do
				  put :update, :id => @company, :company => @attr
				  response.should render_template(:edit)
				end
				  
				it "should have the right title" do
				  put :update, :id => @company, :company => @attr
				  response.should have_selector(:title, :content => "Editing Company")
			  end
			end
			
			describe "success" do
			  before(:each) do
			    @attr = { :title => Factory.next(:title) }
		    end
		    
				it "should change the company's attributes" do
				  put :update, :id => @company, :company => @attr
				  @company.reload
				  @company.title.should == @attr[:title]
			  end
			  
				it "should display a success message" do
				  put :update, :id => @company, :company => @attr
				  flash[:success].should =~ /company was successfully updated/i
			  end
			end
		end
	end
		
	describe "DELETE 'destroy'" do
		describe "for non-signed-in users" do
			it "should deny access"
		end
		describe "for signed-in users" do
			describe "as a non-admin user" do
				it "should protect the action"
			end

			describe "as an admin user" do
				it "should destroy the attempt"
				it "should redirect to the index"
			end
		end
	end		
end