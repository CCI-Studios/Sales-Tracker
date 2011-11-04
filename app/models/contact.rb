class Contact < ActiveRecord::Base
  
  def fullname
    "#{last_name}, #{first_name}"
  end
end
