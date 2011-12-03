class SaleAttrsController < ApplicationController
  before_filter :require_user
  before_filter :get_campaign
  
  def index
    @attrs = @campaign.sale_attrs.all
    @title = "#{@campaign.title} Sales Attributes"
  end
  
  def new
    @attr = @campaign.sale_attrs.new
    @title = "New Sales Attribute"
  end
  
  def create
    @attr = @campaign.sale_attrs.new(params[:sale_attr])
    
    if @attr.save
      redirect_to(campaign_sale_attrs_path(@campaign), :flash => { :success => 'Attribute successfully created' })
    else
      @title = "New Sales Attribute"
      render :action => "new"
    end
  end
  
  def edit
    @attr = @campaign.sale_attrs.find(params[:id])
    @title = "Editing Sales Attribute"
  end
  
  def update
    @attr = @campaign.sale_attrs.find(params[:id])
    
    if @attr.update_attributes(params[:sale_attr])
      redirect_to(campaign_sale_attrs_path(@campaign), :flash => { :success => "Successfully Updated Attribute" })
    else
      @title = "Editing Sales Attribute"
      render :action => "edit"
    end
  end
  
  def get_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
  
end