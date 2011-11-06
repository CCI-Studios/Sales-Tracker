class Company < ActiveRecord::Base
  has_many :attempts
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :title, :presence => true,
                    :uniqueness => { :case_sensitive => false }
  validates :email, :format => { :with => email_regex, :allow_nil => true, :allow_blank => true }
  
  def fullname
    "#{last_name}, #{first_name}"
  end
end

# == Schema Information
#
# Table name: companies
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  phone      :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#

