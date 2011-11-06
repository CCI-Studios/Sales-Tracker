class UsersController < ApplicationController
  before_filter :require_admin, :only => [:index, :new, :create, :show, :edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default root_path
    else
      render :action => :new
    end
  end
    
  def index
    @users = User.all
  end

end