class ProductsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin, :only => [:destroy]
  
  before_filter :get_campaign
  
  def index
    @products = @campaign.products
    @title = "Products"
  end

  def new
    @product = @campaign.products.build
    @title = "New Product"
  end

  def create
    @product = @campaign.products.build(params[:product])
    
    if @product.save
      redirect_to(campaign_products_path(@campaign), :flash => { :success => "New product successfully created" })
    else
      @title = "New Product"
      render :action => "new"
    end
  end

  def show
    @product = Product.find(params[:id])
    @title = "Viewing Product #{@product.title}"
  end

  def edit
    @product = Product.find(params[:id])
    @title = "Edit Product"
  end

  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(params[:product])
      redirect_to(campaign_products_path(@campaign), :flash => { :success => "Product updated" })
    else
      @title = "Edit Product"
      render :action => 'edit'
    end
  end

  private
    def get_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end
end
