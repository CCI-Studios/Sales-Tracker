require 'spec_helper'

describe SalesController do
  describe "GET 'index'" do
  	describe "for non-signed-in users" do
  		it "should deny access"
  	end

  	describe "for signed-in users" do
  		it "should be successful"
  		it "should have the right title"
  		it "should have an element for each sale's total"
  		it "should paginate sales"
  		it "should have an element for each company"
  		it "should have an element for each campaign"
  		it "should have a show link for each sale"
  		it "should have an edit link for each sale"
  	end
  end

  describe "GET 'show'" do
  	it "should be successful"
  	it "should find the right sale"
  	it "should have the right title"
  	it "should have the company's name"
  	it "should have the campaign"
  	it "should have the total"
  	it "should have the carrot"
  	it "should have the sale details table"
  	it "should have a link to the edit page"
  	it "should have a link back to the index"
  end

  describe "GET 'new'" do
  	it "should be successful"
  	it "should have the right title"
  	it "should have a field for the campaign name"
  	it "should have a field for the company name"
  	it "should have a field for the sale total"
  	it "should have a field for the carrot"
  	it "should have fields for the sale details"
  	it "should have a link back to the index"
  end

  describe "POST 'create'" do
  	describe "failure" do
  		it "should have the right title"
  		it "should render the 'new' page"
  		it "should not create a sale"
  	end

  	describe "success" do
  		it "should create a sale"
  		it "should redirect to the sale show page"
  		it "should dislay a success message"
  	end
  end

  describe "GET 'edit'" do
  	it "should be successful"
  	it "should have the right title"
  	it "should have a field for the campaign name"
  	it "should have a field for the company name"
  	it "should have a field for the sale total"
  	it "should have a field for the carrot"
  	it "should have fields for the sale details"
  	it "should have a link to the show page"
  	it "should have a link back to the index"
  end

  describe "PUT 'update'" do
  	describe "failure" do
  		it "should render the 'edit' page"
  		it "should have the right title"
  	end

  	describe "success" do
  		it "should change the sale's attributes"
  		it "should display a success message"
  	end
  end

  describe "DELETE 'destroy'" do
  	describe "for a non-admin user" do
  		it "should protect the action"
  	end

  	describe "for an admin user" do
  		it "should destroy the sale"
  		it "should redirect to the index"
  	end
  end
end
