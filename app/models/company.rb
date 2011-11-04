class Company < ActiveRecord::Base
  has_many :attempts
  
  def fullname
    "#{last_name}, #{first_name}"
  end
end
