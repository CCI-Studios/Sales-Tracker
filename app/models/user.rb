class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  
  has_many :attempts
  has_many :sales
  has_many :companies
  
  acts_as_authentic do |c|
    c.login_field = :email
  end
end



# == Schema Information
#
# Table name: users
#
#  id                :integer         primary key
#  email             :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  created_at        :timestamp
#  updated_at        :timestamp
#  admin             :boolean         default(FALSE)
#

