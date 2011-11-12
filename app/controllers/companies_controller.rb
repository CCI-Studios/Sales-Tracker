class CompaniesController < ApplicationController
  before_filter :require_user
  
  # GET /companies
  def index
    @companies = Company.page(params[:page])
    @title = "Companies"
  end

  # GET /companies/1
  def show
    @company = Company.find(params[:id])
    @title = @company.title
  end

  # GET /companies/new
  def new
    @company = Company.new
    @title = "New Company"
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
    @title = "Editing Company"
  end

  # POST /companies
  def create
    @company = Company.new(params[:company])

    if @company.save
      redirect_to(@company, :flash => { :success => 'Company was successfully created' })
    else
      render :action => "new"
    end
  end

  # PUT /companies/1
  def update
    @company = Company.find(params[:id])

    if @company.update_attributes(params[:company])
      redirect_to(@company, :flash => { :success => 'Company was successfully updated' })
    else
      @title = "Editing Company"
      render :action => "edit"
    end
  end

  # DELETE /companies/1
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    redirect_to(companies_url)
  end
end
