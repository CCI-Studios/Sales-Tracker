class SalesController < ApplicationController
  before_filter :require_user
  
  autocomplete :campaign, :title, :full => true
  autocomplete :company, :title, :full => true
  
  # GET /sales
  def index
    @sales = Sale.page(params[:page])
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
    @sale.campaign_id = 1
    @sale.user = current_user
    @title = "New Sale"
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
    @title = "Editing Sale ##{@sale.id}"
  end

  # POST /sales
  def create
    @sale = Sale.new(params[:sale])

    if @sale.save
      redirect_to(@sale, :notice => 'Sale was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /sales/1
  def update
    @sale = Sale.find(params[:id])

    if @sale.update_attributes(params[:sale])
      redirect_to(@sale, :notice => 'Sale was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /sales/1
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
  end
end
