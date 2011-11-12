class PagesController < ApplicationController
  before_filter :require_user, :except => [:home]
  
  def home
    @title = "Home"
  end

  def about
  end
  
  def release_notes
    @title = "Release Notes"
  end

end
