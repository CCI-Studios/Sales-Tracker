class SaleItemsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin, :only => [:destroy]
  
  def create
    @sale = Sale.find(params[:sale_id])
    @item = @sale.sale_items.build(params[:sale_item])
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to edit_sale_path @sale }
        format.js
      else
        format.html { render :action => "new" }
        format.js
      end
    end
  end
end
