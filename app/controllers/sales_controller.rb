class SalesController < ApplicationController
  before_filter :require_user
  before_filter :require_admin, :only => [:destroy]
  
  autocomplete :campaign, :title, :full => true
  autocomplete :company, :title, :full => true
  
  # GET /sales
  def index
    @sales = Sale.reverse_chronological.page(params[:page])
    @title = "Sales"
  end

  # GET /sales/1
  def show
    @sale = Sale.find(params[:id])
    @title = "Sale ##{@sale.id}"
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @sale.campaign_id = 7
    @sale.user = current_user
    @title = "New Sale"
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
    @title = "Editing Sale"
  end

  # POST /sales
  def create
    @sale = Sale.new(params[:sale])

    if @sale.save
      redirect_to(@sale, :flash => { :success => 'Sale successfully created' })
    else
      @title = "New Sale"
      render :action => "new"
    end
  end

  # PUT /sales/1
  def update
    @sale = Sale.find(params[:id])

    if @sale.update_attributes(params[:sale])
      redirect_to(@sale, :flash => { :success => 'Sale successfully updated' })
    else
      @title = "Editing Sale"
      render :action => "edit"
    end
  end

  # DELETE /sales/1
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    
    redirect_to(sales_path)
  end
end
