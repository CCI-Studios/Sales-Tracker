require 'spec_helper'

describe CompaniesController do
	
	describe "GET 'index'" do
		describe "for non-signed-in users" do
			it "should deny access"
		end
			
		describe "for signed-in users" do
			it "should be successful"
			it "should have the right title"
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
		it "should be successful"
		it "should find the right company"
		it "should have the right title"
		it "should have the company name"
		it "should have the contact name"
		it "should have the phone number"
		it "should have the email"
		it "should have the last contact date"
		it "should have a link to last contact details"
		it "should have a link to edit the company"
		it "should have a link to go back to the index"
	end
	
	describe "GET 'new'" do
		
		describe "failure" do
			it "should have the right title"
			it "should render the 'new' page"
			it "should not create a new company"
		end
		
		describe "success" do
			it "should create a company"
			it "should redirect to the company show page"
			it "should have a success message"
		end
	end
	
	describe "GET 'edit'" do
		it "should be successful"
		it "should have the right title"
		it "should have a title field"
		it "should have a first name field"
		it "should have a last name field"
		it "should have a phone number field"
		it "should have an email field"
		it "should have a link to the the show page"
		it "should have a link back to the index"
	end
	
	describe "PUT 'update'" do
		describe "failure" do
			it "should render the 'edit' page"
			it "should have the right title"
		end
		
		describe "success" do
			it "should change the company's attributes"
			it "should display a success message"
		end
	end
		
	describe "DELETE 'destroy'" do
			it "should destroy the company"
			it "should display a confirmation dialogue"
	end		
end