class CompaniesController < ApplicationController
  before_filter :require_user
  
  # GET /companies
  def index
    @companies = Company.page(params[:page])
  end

  # GET /companies/1
  def show
    @company = Company.find(params[:id])
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  def create
    @company = Company.new(params[:company])

    if @company.save
      redirect_to(@company, :notice => 'company was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /companies/1
  def update
    @company = Company.find(params[:id])

    if @company.update_attributes(params[:company])
      redirect_to(@company, :notice => 'company was successfully updated.')
    else
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
