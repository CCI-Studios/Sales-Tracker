class Company < ActiveRecord::Base
  has_many :attempts
  has_many :sales
  belongs_to :user
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :title, :presence => true,
                    :uniqueness => { :case_sensitive => false }
  validates :email, :format => { :with => email_regex, :allow_nil => true, :allow_blank => true }
  
  scope :alphabetical, order("LOWER(title) ASC")
  scope :search, lambda { |search|
    where('title LIKE :search OR first_name LIKE :search OR last_name LIKE :search or email LIKE :search or phone LIKE :search', { :search => "%#{search}%" })
  }
  
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
#  id         :integer         primary key
#  first_name :string(255)
#  last_name  :string(255)
#  phone      :string(255)
#  email      :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#  title      :string(255)
#  user_id    :integer
#

