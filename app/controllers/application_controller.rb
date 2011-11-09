class ApplicationController < ActionController::Base
  protect_from_forgery  
  include UserSessionsHelper
  
  WillPaginate.per_page = 10
end
