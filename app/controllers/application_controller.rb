class ApplicationController < ActionController::Base
  protect_from_forgery  
  include SessionHelper
  
  WillPaginate.per_page = 10
end
