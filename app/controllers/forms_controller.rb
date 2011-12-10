class FormsController < ApplicationController
  before_filter :require_user
  before_filter :get_campaign
  
  def index
    @forms = @campaign.forms
    @title = "#{@campaign.title}'s Forms"
  end

  def show
    @form = Form.find(params[:id])
    @title = "#{@form.name}"
  end

  def new
    @form = @campaign.forms.new
    @title = "New Campaign Form"
  end

  def create
    @form = @campaign.forms.new(params[:form])
    
    if @form.save
      redirect_to(edit_campaign_form_path([@campaign, @form]), :flash => { :success => 'Form successfully created' })
    else 
      @title = "New Campaign Form"
      render :action => "new"
    end
  end

  def edit
    @form = Form.find(params[:id])
    @title = "Updating Form"
  end

  def update
    @form = Form.find(params[:id])
    
    if @form.update_attributes(params[:form])
      
      redirect_to(edit_campaign_form_path(@campaign, @form), :flash => { :success => "Form successfully updated" })
    else
      @title = "Updating Form"
      render :action => "edit"
    end
  end
  
  def get_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

end
