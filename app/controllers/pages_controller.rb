class PagesController < ApplicationController
  before_filter :require_user, :except => [:home]
  
  def home
  end

  def about
  end
  
  def release_notes
  end

end
