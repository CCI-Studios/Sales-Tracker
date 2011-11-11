require 'spec_helper'

describe AttemptsController do
  describe "GET 'index'" do
		describe "for non-signed-in users" do
			it "should deny access"
		end

		describe "for signed-in users" do
			it "should be successful"
			it "should have the right title"
			it "should have an element for each attempt"
			it "should have an elemet for each company"
			it "should have an element for each estimated value"
			it "should have an element for each verbal"
			it "should have a link to each show page"
			it "should have a link to each edit page"
			it "should paginate contact attempts"
			it "should have a link to create a new attempt"
		end
  end

	describe "GET 'show'" do
		describe "for non-signed-in users" do
			it "should deny access"
		end
		describe "for signed-in users" do
			it "should be successful"
			it "should find the right attempt"
			it "should have the right title"
			it "should have an element for the campaign name"
			it "should have an element for the company"
			it "should have an element for the email"
			it "should have an element for the phone number"
			it "should have an element for the fax"
			it "should have an element for the verbal"
			it "should have a link to the edit page"
			it "should have a link back to the index"
		end
	end

	describe "GET 'new'" do
		describe "for non-signed-in users" do
			it "should deny access"
		end
		describe "for signed-in users" do
			it "should be successful"
			it "should have the right title"
			it "should have a field for the campaign name"
			it "should have a field for the company name"
			it "should have a form for the phone confirmation"
			it "should have a form for the email confirmation"
			it "should have a form for the fax confirmation"
			it "should have a form for the verbal confirmation"
			it "should have a field for the value"
			it "should have a link back to the index"
		end
	end

	describe "POST 'create'" do
		describe "for non-signed in users" do
			it "should deny access"
		end
		describe "for signed-in users" do
			describe "failure" do
				it "should have the right title"
				it "should render the 'new' page"
				it "should not create an attempt"
			end

			describe "success" do
				it "should create an attempt"
				it "should redirect to the index"
			end
		end
	end

	describe "GET 'edit'" do
		describe "for non-signed-in users" do
			it "should deny access"
		end
		describe "for signed-in users" do
			it "should be successful"
			it "should have the right title"
			it "should have a field for the campaign name"
			it "should have a field for the company name"
			it "should have a form for the phone confirmation"
			it "should have a form for the email confirmation"
			it "should have a form for the fax confirmation"
			it "should have a form for the the verbal confirmation"
			it "should have a field for the value"
			it "should have a link to the show page"
			it "should have a link back to the index"
		end
	end

	describe "PUT 'update'" do
		describe "for non-signed-in users" do
			it "should deny access"
		end
		describe "for signed-in users" do
			describe "failure" do
				it "should render the 'edit' page"
				it "should have the right title"
			end

			describe "success" do
				it "should change the attempt's attributes"
				it "should have a success message"
			end
		end
	end

	describe "DELETE 'destroy'" do
		describe "for a non-signed in user" do
			it "should deny access"
		end
		describe "for a signed-in user" do
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