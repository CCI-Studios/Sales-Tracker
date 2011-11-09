module ApplicationHelper
  
  def title
    base = "CCI Sales"
    if @title.nil?
      base
    else
      "#{@title} | #{base}"
    end
  end
  
end
