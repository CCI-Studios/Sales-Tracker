class CampaignsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin, :only => [:destroy]
  
  # GET /campaigns
  def index
    @campaigns = Campaign.alphabetical.page(params[:page])
    @title = "Campaigns"
  end

  # GET /campaigns/1
  def show
    @campaign = Campaign.find(params[:id])
    @title = @campaign.title
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
    @title = "New Campaign"
  end

  # GET /campaigns/1/edit
  def edit
    @campaign = Campaign.find(params[:id])
    @title = "Editing Campaign"
  end

  # POST /campaigns
  def create
    @campaign = Campaign.new(params[:campaign])

    if @campaign.save
      redirect_to @campaign, :flash => { :success => 'Campaign successfully created' }
    else
      @title = "New Campaign"
      render :action => "new"
    end
  end

  # PUT /campaigns/1
  def update
    @campaign = Campaign.find(params[:id])

    if @campaign.update_attributes(params[:campaign])
      redirect_to @campaign, :flash => { :success => 'Campaign successfully updated' }
    else
      @title = "Editing Campaign"
      render :action => "edit"
    end
  end

  # DELETE /campaigns/1
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    redirect_to(campaigns_url)
  end
end
