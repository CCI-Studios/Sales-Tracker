class Company < ActiveRecord::Base
  has_many :attempts
  has_many :sales
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :title, :presence => true,
                    :uniqueness => { :case_sensitive => false }
  validates :email, :format => { :with => email_regex, :allow_nil => true, :allow_blank => true }
  
  default_scope :order => "LOWER(title) ASC"
  
  def fullname
    if !last_name.blank? && !first_name.blank?
      "#{last_name}, #{first_name}"
    else
      "#{last_name}#{first_name}"
    end
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

