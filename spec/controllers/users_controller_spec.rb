require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'index'" do
    describe "for non-signed in users" do
      it "should redirect to home page" do
        get :index
        response.should redirect_to(root_path)
      end
    end
    
    describe "for signed in users" do
      before(:each) do
        @user = test_sign_in(Factory(:user))
      end
      
      describe "for non-admins" do
        it "should redirect to home page" do
          get :index
          response.should redirect_to(root_path)
        end
      end
      
      describe "for admins" do
        before(:each) do
          @user.admin = true
        end
        
        it "should be successful" do
          get :index
          response.should be_successful
        end
        
        it "should have the right title" do
          get :index
          response.should have_selector(:title, :content => "Users")
        end
      end
    end
  end
  
  describe "GET 'new'" do
    describe "for non-signed in users" do
      it "should redirect to home page" do
        get :new
        response.should redirect_to(root_path)
      end
    end
    
    describe "for signed in users" do
      before(:each) do
        @user = test_sign_in(Factory(:user))
      end
      
      describe "for non-admins" do
        it "should redirect to home page" do
          get :index
          response.should redirect_to(root_path)
        end
      end
      
      describe "for admins" do
        before(:each) do
          @user.admin = true
        end
        
        it "should be successful" do
          get :new
          response.should be_successful
        end
        
        it "should have the right page title" do
          get :new
          response.should have_selector(:title, :content => "New User")
        end
      end
    end
  end
  
  describe "POST 'create'" do
    describe "for non-signed-in users" do
  			it "should redirect to home page" do
  			  post :create, :user => {}
  			  response.should redirect_to(root_path)
  		  end
  	end
	
  	describe "for signed-in users" do
  	  before(:each) do
  	    @user = test_sign_in(Factory(:user))
      end
      
      describe "for non-admin user" do
        it "should redirect to home page" do
          post :create, :user => {}
          response.should redirect_to(root_path)
        end
        
        it "should have an error message" do
          post :create, :user => {}
          flash[:notice].should =~ /access is denied/i
        end
      end

      describe "for admin users" do
        before(:each) do
          @user.admin = true
        end
        
  		  describe "failure" do
    		  before(:each) do
    		    @attr = {
              :email => nil,
              :password => "foobar",
              :password_confirmation => "foobaradsf"
            }
          end
      
    			it "should have the right title" do
    			  post :create, :user => @attr
    			  response.should have_selector(:title, :content => "New User")
    		  end
		  
    			it "should render the 'new' page" do
    			  post :create, :user => @attr
    			  response.should render_template(:new)
    		  end
		  
    			it "should not create a sale" do
    			  lambda do
    			    post :create, :user => @attr
    		    end.should_not change(User, :count)
    	    end
    		end

  		  describe "success" do
    		  before(:each) do
    		    @attr = {
              :email => Factory.next(:email),
              :password => "foobar",
              :password_confirmation => "foobar"
            }
          end
      
    			it "should create a user" do
    			  lambda do
    			    post :create, :user => @attr
    		    end.should change(User, :count).by(1)
    	    end
	    
    			it "should redirect to the user index page" do
    			  post :create, :user => @attr
    			  response.should redirect_to(users_path)
    		  end
		  
    			it "should dislay a success message" do
    			  post :create, :user => @attr
    			  flash[:success].should =~ /user successfully created/i
    		  end
    		end
  		end
    end
  end

end