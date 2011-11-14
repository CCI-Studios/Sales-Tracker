class UsersController < ApplicationController
  before_filter :require_admin
  
  def index
    @title = "Users"
    @users = User.all
  end
  
  def new
    @title = "New User"
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_to(users_path, :flash => { :success => "User successfully created" })
    else
      @title = "New User"
      render :action => :new
    end
  end
end